LOCAL_PATH := $(call my-dir)
#$(warning  $(LOCAL_PATH))

# -------------------------------------
#   libfuse-lite                      -
# -------------------------------------
ifeq ($(strip $(SPRD_NTFS_SUPPORT)), true)
include $(CLEAR_VARS)


LOCAL_SRC_FILES := \
    libfuse-lite/fuse.c                  \
    libfuse-lite/fuse_kern_chan.c        \
    libfuse-lite/fuse_loop.c             \
    libfuse-lite/fuse_lowlevel.c         \
    libfuse-lite/fuse_opt.c              \
    libfuse-lite/fuse_session.c          \
    libfuse-lite/fuse_signals.c          \
    libfuse-lite/fusermount.c            \
    libfuse-lite/helper.c                \
    libfuse-lite/mount.c                 \
    libfuse-lite/mount_util.c

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include/fuse-lite     \
    $(LOCAL_PATH)/include/ntfs-3g       \
    $(LOCAL_PATH)/fuse-lite

LOCAL_CFLAGS := -O2 -g -Wall -DHAVE_CONFIG_H -DDEBUG
#LOCAL_CFLAGS +=-std=c99
LOCAL_MODULE := libfuse-lite
#LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_LIBRARY)


# -------------------------------------
#   libntfs-3g                        -
# -------------------------------------
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    libntfs-3g/acls.c       \
    libntfs-3g/attrib.c     \
    libntfs-3g/attrlist.c   \
    libntfs-3g/bitmap.c     \
    libntfs-3g/bootsect.c   \
    libntfs-3g/cache.c      \
    libntfs-3g/collate.c    \
    libntfs-3g/compat.c     \
    libntfs-3g/compress.c   \
    libntfs-3g/debug.c      \
    libntfs-3g/device.c     \
    libntfs-3g/dir.c        \
    libntfs-3g/ea.c         \
    libntfs-3g/efs.c        \
    libntfs-3g/index.c      \
    libntfs-3g/inode.c      \
    libntfs-3g/ioctl.c      \
    libntfs-3g/lcnalloc.c   \
    libntfs-3g/logfile.c    \
    libntfs-3g/logging.c    \
    libntfs-3g/mft.c        \
    libntfs-3g/misc.c       \
    libntfs-3g/mst.c        \
    libntfs-3g/object_id.c  \
    libntfs-3g/realpath.c   \
    libntfs-3g/reparse.c    \
    libntfs-3g/runlist.c    \
    libntfs-3g/security.c   \
    libntfs-3g/unistr.c     \
    libntfs-3g/volume.c     \
    libntfs-3g/xattrs.c     \
    libntfs-3g/unix_io.c


LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include/fuse-lite     \
    $(LOCAL_PATH)/include/ntfs-3g       \
    $(LOCAL_PATH)/ntfs-3g

LOCAL_CFLAGS := -O2 -g -Wall -DHAVE_CONFIG_H -DDEBUG
LOCAL_MODULE := libntfs-3g-lib
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_LIBRARY)

# -------------------------------------
#   ntfs-3g                           -
# -------------------------------------
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    src/ntfs-3g.c         \
    src/ntfs-3g_common.c

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include/fuse-lite     \
    $(LOCAL_PATH)/include/ntfs-3g       \
    $(LOCAL_PATH)/src

LOCAL_CFLAGS := -O2 -g -Wall -DHAVE_CONFIG_H -DDEBUG

LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := libfuse-lite libntfs-3g-lib
LOCAL_MODULE := ntfs3g
LOCAL_POST_INSTALL_CMD := $(hide) ln -sf $(LOCAL_MODULE) $(TARGET_OUT)/bin/mount.ntfs
include $(BUILD_EXECUTABLE)

# -------------------------------------
#   ntfsprogs-->ntfsfix               -
# -------------------------------------
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    ntfsprogs/ntfsfix.c \
    ntfsprogs/utils.c

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include/fuse-lite     \
    $(LOCAL_PATH)/include/ntfs-3g       \
    $(LOCAL_PATH)/ntfsprogs

LOCAL_CFLAGS := -O2 -g -Wall -DHAVE_CONFIG_H -DDEBUG
LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := libfuse-lite libntfs-3g-lib
LOCAL_MODULE := ntfsfix
include $(BUILD_EXECUTABLE)

# -------------------------------------
#   ntfsprogs-->mkntfs                -
# -------------------------------------
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    ntfsprogs/attrdef.c \
    ntfsprogs/boot.c    \
    ntfsprogs/sd.c      \
    ntfsprogs/mkntfs.c  \
    ntfsprogs/utils.c

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include/fuse-lite     \
    $(LOCAL_PATH)/include/ntfs-3g       \
    $(LOCAL_PATH)/ntfsprogs

LOCAL_CFLAGS := -O2 -g -Wall -DHAVE_CONFIG_H -DDEBUG
LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := libfuse-lite libntfs-3g-lib
LOCAL_MODULE := mkntfs
#include $(BUILD_EXECUTABLE)



endif
