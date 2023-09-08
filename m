Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1886DEEB566
	for <ath12k@archiver.kernel.org>; Fri,  8 Sep 2023 18:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OZTrRkqJagjjoFK6vCRzZRAy1dv5CNq+BfUq+nGDW4=; b=j/cB/zqZNg2JFY
	sHu3simnk9UnnLbxGGjjRKAmj01NQV7Lc+oy+bypUF1yb39yRjUMUKymKeMWTJsqoGIMKv1tHEuI+
	O+D2EgACl+oTWGwQfnR6qdSwry/Vcag4ozEkcVFgOpub3l5LzuW2AUa/MXIFi0zmS5Dy/ShCjy1cP
	gjwzltDdyUrQ9e5X37nlJEMERoq5aabmkxLtv5/rovlVRtbW6adY37WewTTkYir/NRYl823N/Po20
	Ygag9hKk430Gqo1Bim1BdB2iTwmS+oOrOHE/vbQHNIS6QZui6JLAs/FrIH2+4sMWCyHp1YIgRGCih
	svTgj+pK2L+E088NU0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg25-00EFca-2d
	for ath12k@archiver.kernel.org;
	Fri, 08 Sep 2023 18:16:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg23-00EFb1-0D
	for ath12k@lists.infradead.org;
	Fri, 08 Sep 2023 18:16:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5BD076155B;
	Fri,  8 Sep 2023 18:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01635C32776;
	Fri,  8 Sep 2023 18:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694196998;
	bh=jKnfc1dNRJYVBOS0uvQuHlKYFzmWbWa5/0ucEK8g9yc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jttF8i4zNZ0TwgFsuxmrsNFjnSpmKOnWwV7QM1qKzbgvsw5pkukMebRb/Pww2HNSg
	 DSO1BxkicfU9S///+St7w15tET3Z2OPfIuCyo787nkKo2ybqjPsMAcbZb3CWiLnQqE
	 zMUZxCy0njQlSIo42Ea9TcVq2GAgbV9lj5YZ6c/mBD8V5kbKYjlmonWirAAphWKsTV
	 0NZ1jK7obktH81Fjy3to9InfHaxIHFflWG1Ix5mdISWW+9iHBqpnr5OFa3N6vaJH0s
	 h7a63r4L0tycv7/pSgQJrfAo2kF1MftDGdAJBc1gymBxmiwR4qzV7uVmYQTvnf6y9H
	 mmyxWA+9OINIA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wen Gong <quic_wgong@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 15/41] wifi: ath12k: avoid array overflow of hw mode for preferred_hw_mode
Date: Fri,  8 Sep 2023 14:15:29 -0400
Message-Id: <20230908181555.3459640-15-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908181555.3459640-1-sashal@kernel.org>
References: <20230908181555.3459640-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_111639_199510_0A30AFDC 
X-CRM114-Status: GOOD (  12.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Wen Gong <quic_wgong@quicinc.com>

[ Upstream commit 1e9b1363e2de1552ee4e3d74ac8bb43a194f1cb4 ]

Currently ath12k define WMI_HOST_HW_MODE_DBS_OR_SBS=5 as max hw mode
for enum wmi_host_hw_mode_config_type, it is also same for the array
ath12k_hw_mode_pri_map.

When tested with new version firmware/board data which support new
hw mode eMLSR mode with hw mode value 8, it leads overflow usage for
array ath12k_hw_mode_pri_map in function ath12k_wmi_hw_mode_caps(),
and then lead preferred_hw_mode changed to 8, and finally function
ath12k_pull_mac_phy_cap_svc_ready_ext() select the capability of hw
mode 8, but the capability of eMLSR mode report from firmware does
not support 2.4 GHz band for WCN7850, so finally 2.4 GHz band is
disabled.

Skip the hw mode which exceeds WMI_HOST_HW_MODE_MAX in function
ath12k_wmi_hw_mode_caps() helps to avoid array overflow, then the 2.4
GHz band will not be disabled.

This is to keep compatibility with newer version firmware/board data
files, this change is still needed after ath12k add eMLSR hw mode 8 in
array ath12k_hw_mode_pri_map and enum wmi_host_hw_mode_config_type,
because more hw mode maybe added in next firmware/board data version
e.g hw mode 9, then it will also lead new array overflow without this
change.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230714072405.28705-1-quic_wgong@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 7ae0bb78b2b53..cef01148fc163 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -3701,6 +3701,10 @@ static int ath12k_wmi_hw_mode_caps(struct ath12k_base *soc,
 	for (i = 0 ; i < svc_rdy_ext->n_hw_mode_caps; i++) {
 		hw_mode_caps = &svc_rdy_ext->hw_mode_caps[i];
 		mode = le32_to_cpu(hw_mode_caps->hw_mode_id);
+
+		if (mode >= WMI_HOST_HW_MODE_MAX)
+			continue;
+
 		pref = soc->wmi_ab.preferred_hw_mode;
 
 		if (ath12k_hw_mode_pri_map[mode] < ath12k_hw_mode_pri_map[pref]) {
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
