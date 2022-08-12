From: Kalle Valo <kvalo@kernel.org>
Date: Fri, 12 Aug 2022 19:09:13 +0300
Subject: [PATCH 00/50] wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices
Message-ID: <20220812161003.27279-1-kvalo@kernel.org>
List-Id: <ath12k.lists.infradead.org>
To: ath12k@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Kalle Valo <quic_kvalo@quicinc.com>

ath12k is a new mac80211 driver for Qualcomm Wi-Fi 7 devices, first
supporting QCN9274 and WCN7850 PCI devices.  QCN9274 supports both AP
and station; WCN7850 supports only station mode. Monitor mode is not
(yet) supported. Only PCI bus devices are supported.

ath12k is forked from an earlier version of ath11k. It was simpler to
have a "clean start" for the new generation and not try to share the
code with ath11k. This makes maintenance easier and avoids major
changes in ath11k, which would have significantly increased the risk
of regressions in existing setups.

ath12k uses le32 and cpu_to_le32() macros to handle endian
conversions, instead of using the firmware byte swap feature utilized
by ath11k. There is only one kernel module, named ath12k.ko.

Currently ath12k only supports HE mode (IEEE 802.11ax) or older, but
work is ongoing to add EHT mode (IEEE 802.11be) support.

The size of the driver is ~41 kLOC and 45 files. To make the review
easier, this initial version of ath12k does not support Device Tree,
debugfs or any other extra features. Those will be added later, after
ath12k is accepted to upstream.

The driver is build tested by Intel's kernel test robot with both GCC
and Clang. Sparse reports no warnings. The driver is mostly free of
checkpatch warnings, albeit few of the warnings are omitted on
purpose, list of them here:

https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath12k/ath12k-check#L52

The driver has had multiple authors who are listed in alphabetical
order below.

Co-developed-by: Balamurugan Selvarajan <quic_bselvara@quicinc.com>
Signed-off-by: Balamurugan Selvarajan <quic_bselvara@quicinc.com>
Co-developed-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Co-developed-by: Bhagavathi Perumal S <quic_bperumal@quicinc.com>
Signed-off-by: Bhagavathi Perumal S <quic_bperumal@quicinc.com>
Co-developed-by: Carl Huang <quic_cjhuang@quicinc.com>
Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
Co-developed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Co-developed-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Co-developed-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Co-developed-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Signed-off-by: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Co-developed-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

--------------[cut]-------------------[cut]-----------------

I have split the driver into multiple patches for easier review, but
the final version will be one big commit.

For easier review I have split the driver into multiple patches (one
file per patch). But in the final version, which will be commited to
git, all these patches will be folded into one big patch. So in the
git archive the full driver be in a single commit to avoid any bisect
issues etc.

This version is based on commit 313fb8aacbba1eae831065d7cb5c68cb97fcace6
from ath12k-bringup branch on my ath.git tree:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath12k-bringup

The patchset applies on top of wireless-next commit:

bafe9528b792f4a442aa1ea2b0297cd53a0351ab

The firmware images are not yet available but they will be soon, the
plan is to publish them before v2 is submitted.

Please review and comment.

Kalle



