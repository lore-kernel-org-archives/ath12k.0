Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16814606A334
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 16:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xesi8DBb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kcz4hHnd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qrd7RRHM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=; b=xesi8DBbwP7i3j
	cOtkuJbL6c7NjPPrawjm6I80SdjqR0ExmHfwsgXWmEtq61g3h8v29AfPfBDHE8+2xT0VXryu3U3RL
	+4BkEUvWZ5hEx7bn9DBftq+kavBZdIHALHwll5TGu/1Kx8eNu4xIZ1nAOTuu1V/pdRKfpCnNsDW4I
	ybF0sfB+eA7A7roLUw7tpPclCmwd/I7wPOLjqfkJe0GmvBlCZLJXSbONBNvCawEh3mb4eU2J3o2kP
	uPrFrn92snSlAbT+2zHFxU3KCyTcnX+c81Hgnrr23gAbrmqkV/IpOBHGlGy95GwT5uHIcvAtLpEMi
	R4YgfD/W6booU8JrON5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtd4-000000079mu-2jP4;
	Tue, 24 Nov 2026 16:44:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcx-000000079fs-2ufN
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 16:44:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFtm8Z1684099
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=; b=Kcz4hHndpHKEDaxl
	yWXSs/R9SJHgM0rdYX+S3A/PPXd7WESEmMygZfqCbxZfz3A0iCysr1+T80waZciT
	alyVlhVOaS2Hv/X3AoofdVyGJ5Ad8gTQVpWEEEARZ5ZlS5VNlezjLF2KsFtw9ozv
	/gmJlzWq+G45lY3nMMM63doVFNuQ1Nx7dCsudk5rJJFPxnf41reUS8fdtOmDzeW/
	bZyHW73VnvZmMnyp4sLpv/IYll4UNsULmmOUAXi9YSGeLnyZdEsQdeByesPsfKw7
	0crw9GItLmNUCsXQpokSJqjHje5IiL68YTx1HEjFw/E4+oW472ekNYmvOw6eJFi1
	x7gZnQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5dngg7g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so4816979eec.1
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538658; x=1796143458; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
        b=Qrd7RRHMh10/mivLvUFGIGwKvqWOmevvF12i3vmI/E5CCylyymzP0OlBhrq7r1CyO2
         BiDa+zzijRh36DC6h/3Of5+rBlUjp72EyMIC0DZPhsn0QmXDujpoGG0iy2YoqgT8/tZt
         PJZm+qtGUEqXiHS5AIRZpkR7zDlzigSdwc/jaRxpizIOPwBsQGsuGgY8uq5U3ridbZcO
         aH4jUwRiFi+v1GIv3Wan+h0EnwG1971CocH8IAxRSAFIzaCAqNkp96uqwev5luS5pQ45
         v9l+SnPiplFNY2AFiW3si/mowmzkWJ0rkisGznHfAFkziyjli/WnqjJCFNKkdNZemzjU
         TeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538658; x=1796143458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
        b=UVZntfgsATAsa01uENvt/CdjOGGaxATGKeLBDhZcILPPfzrBVnh+mjdXO8+v93OyEq
         0/32e0SM1Esf1KjrytP4eGVAvN0Q4ruIVye4B5BSZTamjI4MsPXL1Z4H5n5c0mW/ggWV
         oymI+Tpl8vawR6Hs6b6E8BYg9mwFzO1r6WSf3cVKYIaFIGS+yhn19Te7v9fAwrJn/VNl
         Md7G/XIxLsH6FdNAEBa1wkSbzjt0bwLo3El0hjgBpIMFbGENtLbYULlM0nWbJJ8aHa2V
         qhVYk4QQ1fDM9zRE/jT1eLUlMHTnR9rU1LCRIdukbDBiWAX8QOiGxKpujmgKVCmoiQ44
         Gykg==
X-Forwarded-Encrypted: i=1; AL+hErEw5EVAbBgalilaFTOj7CclMy8sDE1FSJ8JJPqcKIIDARZxUJ262YdtCN8JvP/eYLROQciFGp8=@lists.infradead.org
X-Gm-Message-State: APuU4Z993+aaTQUomdMbtAouE+0EZP1StnmrkTxF/wNyX4g8mnsvjc2G
	Dr6qrtN3O7LQhiVoh8rj1ri9C9iKAWR2zsCwzBuZaK1Yif8cFllt42Dv5VMaWlp0K54E7rGZPCT
	radGWnsgmas/orkT8U3v4jrRYeA4crQVtKPTUO48V9go0/N+hsEHP34MeeQt73HG7
X-Gm-Gg: AZFdTZf7jv1nCG0sOUXzzFw0J9I+p8RkhlQIL+sD2VVzOMRdp3pV5MNCsKWay0RVF0d
	aDKLO6CH+JKS6iVuKBkXaiZoyoXlDC38SfPy+AH7E8gjQOVOOwn/eRp0oBD7xE0t6wwAMbIJvhs
	njhYAz4YvZauTm2Ypbz4794gHoc/8MfNyW7nf/VCYR2OuqDOxGWHXBl0CToD7C/mVOCK4mCRPRa
	Rhr3kNTEhTnqbJGai8GiEgrxPRkGw2RNMEk4lxjthtiX9UsSv4GNfNyoxu3K98UW3GClsf1l9UV
	agasZNP84gLWRYdKs+OKka8X2rkX3AWwBMno7YBhug6L7Rtp/xmy1cgPgjnj10YVhKx6iPtre8c
	WF0/mrACrMb4OaN6Mn/uNUq5hAmJZbE0rotBq/+rOkLYcFdAZhV5yztC8QUQlQ6xaZM5fmYePpn
	zi5iPB5z24R7t/JGHip4Ek/pStgZSMlzVV+0OmMPR8fwZaKr9nW7RmYB71VB1Nqc4hghEnom56I
	3k=
X-Received: by 2002:a05:693c:69d4:b0:36c:a154:db1d with SMTP id 5a478bee46e88-3856c6b41eemr15643624eec.4.1795538658313;
        Tue, 24 Nov 2026 08:44:18 -0800 (PST)
X-Received: by 2002:a05:693c:69d4:b0:36c:a154:db1d with SMTP id 5a478bee46e88-3856c6b41eemr15643576eec.4.1795538657426;
        Tue, 24 Nov 2026 08:44:17 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:34 +0530
Subject: [PATCH ath-next v4 08/14] wifi: ath12k: add unified firmware image
 support for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-8-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX1Gcono/yyHNJ
 TletI+yGD3Qauvq4IwNKhBXSszlcCY2gREbqlAslnBx5uuEZZ/GSjp0PUVIV9co6rcCVp8tydqW
 yXPmHtEV/jqGmjD6Wa3XNF3xE55pbZA=
X-Proofpoint-ORIG-GUID: SX7UlTfTRdcNxz0tqvaqSKrYrGaOgR69
X-Proofpoint-GUID: SX7UlTfTRdcNxz0tqvaqSKrYrGaOgR69
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX2WyPDn9fb8kK
 gCKHkbUkbrehcfxSWq2gszJbDiWjILTkhNisv4vY1NfD6SAsC8hRAne9ZPE8IB2M62RjB3vvP12
 Jcbxjd57Q2KMsS/23T19F6uL9ok4Ciknq4rSPvcHIh0+4eDv9P+OYxP+kB/ZGluctCg2DUPuLUH
 +Bo1y3uL/N6Y0P3JQSqC7Gp+/futi6tFH0qiT0ImanLqwweMSuuUVj2HZU1VQwcj+gAp17eBCUl
 aBtqGj225GxJE9tFaE2Xa7oU3ylxpJD6O0t9/mxtBbdL7VOnkSLgT7TKyfAva0Zx2QVQf1vDd0h
 Z3u3yZPwqVbDBGksn1Gnctxekt6X3DQf0dKchqME/VoaYR/kqICh7UkGH1bFcMTYmF7mAp6yw1b
 OdWceFosi4GpNFP/+liFRKs5cl2cK23dAia+M1D8drzzDbR0Bwv749mU9qnWzfIjJ5S4W8qRR20
 xPoc0LW7i7JuCDXqLsg==
X-Authority-Analysis: v=2.4 cv=U9cHnuru c=1 sm=1 tr=0 ts=6b05bee3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yptJjfQlWYdCmDOAxUgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084419_782196_99AD06ED 
X-CRM114-Status: GOOD (  26.09  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Wi-Fi 7 chips select between single-mac and dualmac firmware images
based on the OTP board ID, loading a separate firmware-N.bin for
dualmac boards. QCN9575 (Wi-Fi 8) instead ships a single unified
firmware image for all board variants and expects the host to write
the OTP board ID into a PCIe local scratch register so firmware can
determine the board configuration itself at boot.

Add the unified_fw_image flag to ath12k_hw_params.fw and set it to
false for all existing Wi-Fi 7 hw_params entries, with QCN9575 as the
only chip enabling it. In ath12k_mhi_register(), once the OTP board
id is read, stash it in ab_pci->unified_fw_board_id for unified-image
chips instead of running the dualmac firmware-selection path, since a
single firmware blob is used regardless of board id.

Add unified_fw_board_id_reg to ath12k_hw_regs and populate it for
qcn9575_regs with the PCIe local scratch register address, keeping
the register layout per-chip and self-contained. Introduce
ath12k_pci_update_unified_fw_board_id() to write the cached board id
into that register and read it back, since iowrite32()/ioread32()
give no other way to detect a failed write. Call it from
ath12k_pci_power_up() before MHI start for unified-image chips, and
return -EIO on a readback mismatch so ath12k_pci_power_up() aborts
before starting MHI and firmware. Continuing after a mismatch would
let firmware boot with whatever stale or incorrect value is already
in the register and self-configure for the wrong board silently,
with no symptom beyond a warning in the kernel log.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h              |  1 +
 drivers/net/wireless/ath/ath12k/hw.h               |  1 +
 drivers/net/wireless/ath/ath12k/mhi.c              |  4 ++-
 drivers/net/wireless/ath/ath12k/pci.c              | 31 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/pci.h              |  3 +++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  7 +++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         |  1 +
 8 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 4b0fbd6f4aea..9e88bdf4a93b 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1219,6 +1219,7 @@ struct ath12k_hw_regs {
 	u32 gcc_gcc_pcie_hot_rst;
 
 	u32 qrtr_node_id;
+	u32 unified_fw_board_id_reg;
 };
 
 /* HAL context to be used to access SRNG APIs (currently used by data path
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 6fd87482425a..9c11edd2b051 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -160,6 +160,7 @@ struct ath12k_hw_params {
 		size_t cal_offset;
 		enum ath12k_m3_fw_loaders m3_loader;
 		bool download_aux_ucode:1;
+		bool unified_fw_image:1;
 	} fw;
 
 	u8 max_radios;
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 56e697fbdad5..90b7774ae6e8 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -211,6 +211,8 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		if (!board_id || (board_id == OTP_INVALID_BOARD_ID)) {
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
 				   "failed to read board id\n");
+		} else if (ab->hw_params->fw.unified_fw_image) {
+			ab_pci->unified_fw_board_id = board_id;
 		} else if (board_id & OTP_VALID_DUALMAC_BOARD_ID_MASK) {
 			dualmac = true;
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
@@ -218,7 +220,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		}
 	}
 
-	if (dualmac) {
+	if (!ab->hw_params->fw.unified_fw_image && dualmac) {
 		if (ab->fw.amss_dualmac_data && ab->fw.amss_dualmac_len > 0) {
 			/* use MHI firmware file from firmware-N.bin */
 			mhi_ctrl->fw_data = ab->fw.amss_dualmac_data;
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 6617440954b1..d238603f6075 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -976,6 +976,24 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
 						   PCI_EXP_LNKCTL_ASPMC);
 }
 
+static int ath12k_pci_update_unified_fw_board_id(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+	u32 reg, val;
+
+	reg = PCIE_UNIFIED_FW_BOARD_ID_REG(ab) & WINDOW_RANGE_MASK;
+	ath12k_pci_write32(ab, reg, ab_pci->unified_fw_board_id);
+
+	val = ath12k_pci_read32(ab, reg);
+	if (val != ab_pci->unified_fw_board_id) {
+		ath12k_warn(ab, "unified_fw_board_id readback mismatch: wrote 0x%x, read 0x%x\n",
+			    ab_pci->unified_fw_board_id, val);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
 {
 	int i;
@@ -1484,16 +1502,27 @@ int ath12k_pci_power_up(struct ath12k_base *ab)
 	if (ath12k_fw_feature_supported(ab, ATH12K_FW_FEATURE_MULTI_QRTR_ID))
 		ath12k_pci_update_qrtr_node_id(ab);
 
+	if (ab->hw_params->fw.unified_fw_image && ab_pci->unified_fw_board_id) {
+		ret = ath12k_pci_update_unified_fw_board_id(ab);
+		if (ret)
+			goto err_unwind;
+	}
+
 	ret = ath12k_mhi_start(ab_pci);
 	if (ret) {
 		ath12k_err(ab, "failed to start mhi: %d\n", ret);
-		return ret;
+		goto err_unwind;
 	}
 
 	if (ab->static_window_map)
 		ath12k_pci_select_static_window(ab_pci);
 
 	return 0;
+
+err_unwind:
+	ath12k_pci_msi_disable(ab_pci);
+	ath12k_pci_aspm_restore(ab_pci);
+	return ret;
 }
 
 void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 62b72558c0e2..70952a52a1b1 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -38,6 +38,8 @@
 #define PCIE_SMLH_REQ_RST_LINK_DOWN		0x2
 #define PCIE_INT_CLEAR_ALL			0xffffffff
 
+#define PCIE_UNIFIED_FW_BOARD_ID_REG(ab) \
+	((ab)->hal.regs->unified_fw_board_id_reg)
 #define PCIE_QSERDES_COM_SYSCLK_EN_SEL_REG(ab) \
 	((ab)->hal.regs->pcie_qserdes_sysclk_en_sel)
 #define PCIE_QSERDES_COM_SYSCLK_EN_SEL_VAL	0x10
@@ -144,6 +146,7 @@ struct ath12k_pci {
 	const struct ath12k_pci_reg_base *reg_base;
 
 	u32 window_reg_addr;
+	u32 unified_fw_board_id;
 };
 
 struct ath12k_pci_driver {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..282a41980d98 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -413,6 +413,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -509,6 +510,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 
 		.max_radios = 1,
@@ -607,6 +609,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,
@@ -702,6 +705,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -792,6 +796,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = true,
+			.unified_fw_image = false,
 		},
 
 		.max_radios = 1,
@@ -891,6 +896,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -983,6 +989,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
index 076a5a609f8b..92ea24634100 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
@@ -68,6 +68,7 @@ const struct ath12k_hw_regs qcn9575_regs = {
 	.gcc_gcc_pcie_hot_rst = 0x1e38438,
 
 	.qrtr_node_id = 0x01e03300,
+	.unified_fw_board_id_reg = 0x1e03304,
 };
 
 static int ath12k_hal_srng_create_config_qcn9575(struct ath12k_hal *hal)
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 91d8f762e642..bffd1081fd2f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -24,6 +24,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = true,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,

-- 
2.34.1


