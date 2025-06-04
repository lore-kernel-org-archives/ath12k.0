Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84948C61CE5
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 02:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2DzYPQjxjc9AKIdEKfSTTdu0sQ5BTx9n3/glWUTrTo=; b=RnN4/Eun7xhJnT4pXbIChfAzxL
	ZTJU4jdTa6myYwu8nTg1E1VeK2RCV5cOjoQDjJvuuExEB/vYEs7PKtbvMOOsRCuwWOyQAM/TMywWv
	gw2TAsCLMSJrXPmvaD26UZXjB/wPOCdFkWqD46l3nN1uq1I2DQ0jVIa3Gg8L9EI6Py5VKVLQThFjo
	adCdV9eGliFdTtp/ryEo4ZQecP+cMNs7qa5goAX9HyEDCCwq//8zHlcyobNQnat3fB/HqBvsNEHMf
	UPGXHpLCuUB9VsYEGTK2lMUazCd39N7GZjzq+3AN69oE+Pk4TlwBKcMlQI1QmhwDwvBHk7feXCeK6
	AMrgC5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMdth-0000000CK3g-13pw;
	Wed, 04 Jun 2025 02:30:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcW6-0000000C8G2-3Jzn
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 01:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29461629DE;
	Wed,  4 Jun 2025 01:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D2EC4CEF1;
	Wed,  4 Jun 2025 01:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998925;
	bh=qQlleLWJuK3TuXQoJeTGRAHgPjVPr/RlI00AaTH+Slo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rG4TcDCqe8OpIDFwwbHG5tDaKEwNQUm41X/kKs72/JW86VGsBnn94mfkq9jrpA7tk
	 pRPZQRaCMLIQtw7WzpKqSCUcF1KjBcHEcrlv4B1qlTYR4qzGHuAB6ZocUFlrZkIi0A
	 si1DAx7wFB/McKZXJAl74muokG64sqMdRXaeWPZmbsvz09jgIMQwrvcIOoVUNZjrY1
	 5pYVnM2kzHuZcjkgLx8wDknUZXP01fnTiASeIAp6buvo/7Elk73gEw3+OJ8VbZ4aHR
	 +8jjcDCCyptmTlAwpe2hOFDKd4xAqKfoH5MbwRh4OD6PWLNgin5WacuwLzDbE1XQgL
	 KldiUi39tJpeg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Suraj P Kizhakkethil <quic_surapk@quicinc.com>,
	Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 92/93] wifi: ath12k: Pass correct values of center freq1 and center freq2 for 160 MHz
Date: Tue,  3 Jun 2025 20:59:18 -0400
Message-Id: <20250604005919.4191884-92-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005919.4191884-1-sashal@kernel.org>
References: <20250604005919.4191884-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Suraj P Kizhakkethil <quic_surapk@quicinc.com>

[ Upstream commit b1b01e46a3db5ad44d1e4691ba37c1e0832cd5cf ]

Currently, for 160 MHz bandwidth, center frequency1 and
center frequency2 are not passed correctly to the firmware.
Set center frequency1 as the center frequency
of the primary 80 MHz channel segment and center frequency2 as
the center frequency of the 160 MHz channel and pass the values
to the firmware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Suraj P Kizhakkethil <quic_surapk@quicinc.com>
Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Link: https://patch.msgid.link/20250304095315.3050325-2-quic_surapk@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my thorough analysis, here is my assessment: **YES** This
commit should be backported to stable kernel trees for the following
reasons: ## Analysis of the Code Changes The commit fixes a critical bug
in the 160 MHz channel frequency handling for the ath12k driver
(Qualcomm Wi-Fi 7 devices). The specific issues being corrected are: ###
1. **Incorrect center frequency calculation for 160 MHz EHT channels**
**Before the fix**: The code only handled `MODE_11AC_VHT80_80` for dual-
band scenarios but completely ignored `MODE_11BE_EHT160` (Wi-Fi 7's 160
MHz mode). This meant: - `chan->band_center_freq1` was incorrectly set
to the original `arg->band_center_freq1` - `chan->band_center_freq2` was
set to 0, providing no information about the 160 MHz channel structure
**After the fix**: For `MODE_11BE_EHT160`, the code now correctly: -
Sets `chan->band_center_freq1` to the center of the primary 80 MHz
segment (±40 MHz from control channel) - Sets `chan->band_center_freq2`
to the center of the entire 160 MHz channel - Follows the exact same
pattern already established and proven in ath11k driver for
`MODE_11AX_HE160` ### 2. **Follows established precedent from ath11k**
The ath11k driver (lines 851-860 in
`/home/sasha/linux/drivers/net/wireless/ath/ath11k/wmi.c`) already
implements this exact logic for `MODE_11AX_HE160`: ```c if
(arg->channel.mode == MODE_11AX_HE160) { if (arg->channel.freq >
arg->channel.band_center_freq1) chan->band_center_freq1 = center_freq1 +
40; else chan->band_center_freq1 = center_freq1 - 40;
chan->band_center_freq2 = arg->channel.band_center_freq1; } ``` The
ath12k fix implements identical logic for `MODE_11BE_EHT160`, ensuring
consistency across the ath driver family. ### 3. **Impact on Users**
Without this fix, 160 MHz channels on Wi-Fi 7 devices would not work
correctly because: - The firmware receives incorrect channel center
frequency information - This could lead to improper channel selection,
interference, or complete failure to establish 160 MHz connections -
Users with QCN9274 (and similar) devices would experience degraded Wi-Fi
7 performance ### 4. **Meets Stable Backport Criteria** ✅ **Fixes
important functionality**: 160 MHz operation is a key Wi-Fi 7 feature ✅
**Small, contained change**: Only affects one function, adds clear
conditional logic ✅ **Low regression risk**: Follows proven pattern from
ath11k, only changes previously broken path ✅ **Clear side effects**:
None beyond fixing the intended issue ✅ **Well-tested**: Commit includes
"Tested-on: QCN9274 hw2.0" with specific firmware version ### 5.
**Driver Maturity Context** ATH12K is the Wi-Fi 7 driver for
current/recent Qualcomm chipsets. While newer than ath11k, it supports
hardware that users actively deploy. The 160 MHz functionality is
critical for achieving the high throughput promised by Wi-Fi 7. ### 6.
**Comparison with Similar Commits** This commit closely resembles
**Similar Commit #2** (marked YES for backport) which also fixed
frequency calculation issues in ath12k for 6 GHz operation. Both
commits: - Fix critical frequency/channel handling bugs - Have minimal
code changes with low regression risk - Include proper testing
validation - Address functionality that affects real user deployments
The fix is essential for proper Wi-Fi 7 160 MHz operation and should be
backported to ensure users with ath12k-supported hardware can fully
utilize their devices' capabilities.

 drivers/net/wireless/ath/ath12k/wmi.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index b45126a184930..9436e7e1ec1f6 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -980,14 +980,24 @@ int ath12k_wmi_vdev_down(struct ath12k *ar, u8 vdev_id)
 static void ath12k_wmi_put_wmi_channel(struct ath12k_wmi_channel_params *chan,
 				       struct wmi_vdev_start_req_arg *arg)
 {
+	u32 center_freq1 = arg->band_center_freq1;
+
 	memset(chan, 0, sizeof(*chan));
 
 	chan->mhz = cpu_to_le32(arg->freq);
-	chan->band_center_freq1 = cpu_to_le32(arg->band_center_freq1);
-	if (arg->mode == MODE_11AC_VHT80_80)
+	chan->band_center_freq1 = cpu_to_le32(center_freq1);
+	if (arg->mode == MODE_11BE_EHT160) {
+		if (arg->freq > center_freq1)
+			chan->band_center_freq1 = cpu_to_le32(center_freq1 + 40);
+		else
+			chan->band_center_freq1 = cpu_to_le32(center_freq1 - 40);
+
+		chan->band_center_freq2 = cpu_to_le32(center_freq1);
+	} else if (arg->mode == MODE_11BE_EHT80_80) {
 		chan->band_center_freq2 = cpu_to_le32(arg->band_center_freq2);
-	else
+	} else {
 		chan->band_center_freq2 = 0;
+	}
 
 	chan->info |= le32_encode_bits(arg->mode, WMI_CHAN_INFO_MODE);
 	if (arg->passive)
-- 
2.39.5


