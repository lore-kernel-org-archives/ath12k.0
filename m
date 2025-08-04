Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC814C87FCB
	for <ath12k@archiver.kernel.org>; Mon,  4 Aug 2025 03:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ws4K34M895QlwoqCvDCnlEt/m9zE1eKyV/9hDVzwdwA=; b=j0S7uY58M8HJt9QZaclBrXvAZQ
	j7g2/6pv/FXegHSIeCKcDsQqxT9bJNV6Zmai3Ao9qOZm4YzIIzFNatsNnllDrNOU6LtwTJQ1vKjvg
	ZGvdo/EeITS8T0rt7mBVMDP4aAEXUgiCGW5Y+cB597Ep7mW29Yef+GADH/BvlIHfAv4EnskIlie2S
	VAlfUclPGGjcZN4WKZJCuyrMq427nePwqG/UQQrwuvdobRf1mx+U1UEqgUXMum6ZbeR9oU5bRdggx
	ECWNx0h/Y1woIsHnqv+ZNOlIZAxCktf0rlxbxMujvlLA/4U1FMmGiR91XMJiCbshfPVDGIHwds+rO
	A/Unr6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilU6-00000009Wme-2TEH;
	Mon, 04 Aug 2025 03:03:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilU3-00000009Wlg-4ATC
	for ath12k@lists.infradead.org;
	Mon, 04 Aug 2025 03:03:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5741Nka4031987
	for <ath12k@lists.infradead.org>; Mon, 4 Aug 2025 03:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ws4K34M895QlwoqCvDCnlEt/m9zE1eKyV/9hDVzwdwA=; b=hZnr9AmEJIIm/hBU
	fzKLwCRWWUOWCxvwjZGHxP4X/PXt9H+WCJcns3ZyEVFyDslivoEArEgKWaDckw7n
	irbZYKBNY2Pi5IyQv3dtbAcKPwDrMboPTNdu1QHlZcCdrVdt56x9AqRyTB57VxAC
	oY76ggdZfMWVRB2aIFJ0MMeHLaevRBQSUadkTEUs+KXg/jLg7Txvik0RC66tt9tK
	obCodXGi0Uozsf/C11jLnnw78OJOTw44TLLnzczQYiLVws6+kCt9KqhNcsDYTHDn
	DNRyCMQUzJkuMBzPK3IflC+N2qF2ou+r5e1kaZs37rFMCidTE/U2wRLCCGkHwASk
	TL11hQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ak5a06fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 03:03:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so5039431a12.1
        for <ath12k@lists.infradead.org>; Sun, 03 Aug 2025 20:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754276609; x=1754881409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ws4K34M895QlwoqCvDCnlEt/m9zE1eKyV/9hDVzwdwA=;
        b=LaOJaiWYeuLRjkurF+KlltM2g/vQQJjX4E4MboyC6R/drkFD/H3gpO9aKJjYbkBX+l
         p19hWkMn9xHwTaFahrkuP5ypiEw68rp5iKQySSbCiwEuyQBnEarFTD5aZlw3InBeeQSN
         2D7DXd1pRcVM1mg+oHM5V5B2z03mexLYSotSRE2PRyUgruMf9abuIcTZoZhBGmx1E5Y8
         Q2Yk8KQ/IcGqzqTgxUV9adw+P3IuYFsEGfBVPw3uMLwscDIe9clcI16rI7JlzmH4NLf/
         W0s9yKqsHyt2ncYWmtSbIVgdP2Rxf+JyBJ7MTj+HPBoa2Md5S14hTH+kwZtQw2hPMNu5
         KBgg==
X-Forwarded-Encrypted: i=1; AJvYcCW72U2nH+rUegDHWIFGGJnxj7TIttpvBQ3SfV+nie4d9B0XJ/aLM/dOy3AJ0GmHFXfcqTWXvlQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUPl3yK38oEP/DJgz5cZRWacZMksYYkBBvY9Ejc5nrySVJf7HE
	pClMWLa0Ohg0u0E5oaDLDeWCjO4kqbwcUmCX+dly9CV0/Db9pRaU6N5tzeVwr+ka2CqsmFbv/oT
	a6bKkMbe/s8qNdpEGMeb8fESeabNLUSFcf+Zdq5DXpDi2rgaT/BwXpSaxPIrsbdGa
X-Gm-Gg: ASbGncuAI96aAkVEkeJVr/qVVxLl7QiYm09UjIs42p8jweE8v9YHgIkta7NVRjcHUBl
	tauDjAhGSC1hSL5EaM2P1g32r1ixfmRyGXoQeWl3SVCy9dfUAymw103y4qCoIZfyVQXhUtmORVk
	BSM7oR5hYbeYChMug6Vny2T6U/xQRHZ8YgvQICBmHuyu9qXBV7XwwYNPypZR+jCJpVZ51fYLjX3
	aoO4kYG0pQOk+sO4JsXo+hnzl9SyAicwX8XiG3eBUjgPLMetgJT1D+8RfgyoxxeELZKDrNMK+WN
	I6A6LaR/EogOQmCKZdcajMV9rN+Bs7lVIFP9OoT4QOiM+xXoW2/lNZpovFdsYZtMPKNomSGmpqm
	EqwlCZdJjIObckcxjYQ==
X-Received: by 2002:a05:6a20:1583:b0:234:8b24:108d with SMTP id adf61e73a8af0-23df9802825mr12965502637.22.1754276609363;
        Sun, 03 Aug 2025 20:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNOz3T56VRaGLUiNKjisoMK0eXMn1xWIfG3yzjpBzA6Ry//yUXJa0ThZsF7/BH5KTDJ3p0bw==
X-Received: by 2002:a05:6a20:1583:b0:234:8b24:108d with SMTP id adf61e73a8af0-23df9802825mr12965460637.22.1754276608919;
        Sun, 03 Aug 2025 20:03:28 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3207ebc0e79sm10489000a91.10.2025.08.03.20.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 20:03:28 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 11:03:10 +0800
Subject: [PATCH ath-next 1/2] wifi: ath12k: initialize eirp_power before
 use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-1-56f1e54152ab@oss.qualcomm.com>
References: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-0-56f1e54152ab@oss.qualcomm.com>
In-Reply-To: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-0-56f1e54152ab@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAxNCBTYWx0ZWRfX2oNDA4JDzJLn
 cyEl9MW6wHrVWClfuf+3IRrRBoa4hZbnn7ullI+8TnQbPBXSmUdkgwM95TZMkgBk4XCfcQOVqQt
 AVtr3eM2qlhSiUVZgcfSR42Tn96Nq5JnsFGXa9eYnXwT/479lWUCjw1W6jIoVAPX/3Eq+tJn2cJ
 rDDSam2+UNOhhFWgKCP2dVB/oGFzgyzN8VK6UQVFd5qK7klk2Ul8OEc5QhIaDCkAoObNyi3GENu
 sI80wxElkFYPosC1fZHdWbHFzu/VkoervR1q0XvweOJDVgx19/Du2GRrTQr07UZ2fSPdRdmTbSZ
 PwT2mD34+R0odC/W0D4Q51XVoaH8vwtgZzaA35ipFuREBDA2M/I317U7DG21CsxSX1H41Lgk5Y+
 4Be1ry64f7e3QmaacIaNbsXZyvl5nTw76AwudL7v36IIVGotvy1BGNccWy0HIFDod90eymyq
X-Proofpoint-GUID: 5yknQV2PpZdQzD7wU6KxVw7_rUDls06x
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=68902302 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=LZTIgfvDWzmdvsE2OGQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5yknQV2PpZdQzD7wU6KxVw7_rUDls06x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_01,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=744 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_200332_163997_135EA735 
X-CRM114-Status: GOOD (  15.42  )
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

Currently, at the end of ath12k_mac_fill_reg_tpc_info(), the
reg_tpc_info struct is populated, including the following:
reg_tpc_info->is_psd_power = is_psd_power;
reg_tpc_info->eirp_power = eirp_power;

Kernel test robot complains on uninitialized symbol:
drivers/net/wireless/ath/ath12k/mac.c:10069
ath12k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'

This is because there are some code paths that never set eirp_power, so
the assignment of reg_tpc_info->eirp_power can come from an
uninitialized variable. Functionally this is OK since the eirp_power
only has meaning when is_psd_power is true, and all code paths which set
is_psd_power to true also set eirp_power. However, to keep the robot
happy, always initialize eirp_power before use.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: aeda163bb0c7 ("wifi: ath12k: fill parameters for vdev set TPC power WMI command")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202505180927.tbNWr3vE-lkp@intel.com/
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index bd1ec3b2c084169b841146931c54b6106f7006f6..8295480e8b1eeaa3e69cca823e6745733ade50e0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11228,8 +11228,8 @@ void ath12k_mac_fill_reg_tpc_info(struct ath12k *ar,
 	struct ieee80211_channel *chan, *temp_chan;
 	u8 pwr_lvl_idx, num_pwr_levels, pwr_reduction;
 	bool is_psd_power = false, is_tpe_present = false;
-	s8 max_tx_power[ATH12K_NUM_PWR_LEVELS],
-		psd_power, tx_power, eirp_power;
+	s8 max_tx_power[ATH12K_NUM_PWR_LEVELS], psd_power, tx_power;
+	s8 eirp_power = 0;
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	u16 start_freq, center_freq;
 	u8 reg_6ghz_power_mode;

-- 
2.25.1


