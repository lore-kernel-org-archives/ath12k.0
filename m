Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FB1C3600C
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxD1d8+SURGaW2WmT3Vs97sir9axBka6nu3u7fHBVV4=; b=Hhe3rJ55zmTWwg08ck8yBKXPse
	Eewi6E8QK4jAE7cm+NHBa1v4K14hIBpu7AjG/t3kkqqGIvlmesG1zKlmJ+aolnqb0Z0yHBc5UNW4A
	mSlMudFarMKMibvF1VxAn8PHiTpV2pZ4fdiuv0bPIgnq6KK4mAzYszN7A5ODEhSmBh6/aCvSTBZnv
	fM2Ujsmx+3EA3BEc6YimsM9w9Qgr2OU92AZi3JUIBDxQ7Ooyxq6Bv7eYdy12o5gFagj6pV4s6UBxr
	2xQv1o5dycSK/MGdlqrvXICZpTjNFzzMwRt/OAjXrgjI8goKJl3uVHUxbEMJFs+UKrukhmpEepGa0
	si8vhCbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Bw-00000002rrc-40PG
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:12:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u226n-00000002qlS-1eCs
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:06:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GTX8009179
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxD1d8+SURGaW2WmT3Vs97sir9axBka6nu3u7fHBVV4=; b=Q90arvgMkL3TE1WA
	mysAs83NjH5kzrWE3STROVHVvYMG77Sh+YFpUtpIf1QZG58NkwHrA4uwgCHwJsJ1
	Tr7gNTz9tCZ+PyhONtCnVhLi0qPVM1kZ4aP2Q9Lzanu0CWwXgUZ6mUF7DRm5/Dbk
	pQCqNRcrYBovURYF5PhbVfyf0GynOtA8I+gwyuMWW6NhNp3HZIoV0q+1jvmntwKI
	DtwLEYYsa0q9DxlmV8uPMgp+RsTb+Sg/nZRSzg45ITSsEjfU10+xfwdcZ0QIURDj
	YN7TNezaQy9rxyq2GIGpERK1pBtrdsyWLa0KXoYTaaLQ6PYIL7phPkGaJWmRBDvF
	LKG/TQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftekp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:06:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73720b253fcso4091488b3a.2
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092412; x=1744697212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxD1d8+SURGaW2WmT3Vs97sir9axBka6nu3u7fHBVV4=;
        b=p6agFzWMsWp3DcojNYNjfAda4lX/c4at2iQDFb95BgFaiZPKHip7WOpxf37E3v8O/4
         E5zX2lmLBtKRwSUIsKoJCsPUKsCIlXMASwvHy3q00t5rdAF9H4Z/S+XMueeI8rECBSUn
         LwX39yRYqgB7KSP8237oCshMLFPR+XoFn8EAcAwGeV3miXrlaxv5arTsvgH7QEuo2fv5
         POXSiewu4hHCA64v+1bAKsnR1eIfsW5g255q3/H/Ffy08yqYxXK/Hh2GJBpXtKDaGqgh
         Xc3CKGrapSSnxX3pGtbfZm5BTdVdzW8fFtcU9FugPPye0bzrS+8Q2EFBufiZHa1iJAdU
         VwOg==
X-Forwarded-Encrypted: i=1; AJvYcCUbjWD7bGWqFpQ/HxPDHpoUjPTR/zgS66CN+lXMJCTNGCfRrc9kU+0UnMIBhWuJPQeiZumPZ3Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4Q+FyHLfcp8Ncu7SvkAXwwXRelPcUcpAZMk6PkQieZp1oehTd
	GJC6C2/vbOM1Qp5/bQEMehzJ8X5jtJmQrhRhSISQaEgbg4cL+BMA7MYiQFnrgfR1QITIZg0qUf9
	Qi1s6fxaZzpsi3dtxHKPiVf7FpZri0TLFAeYyZ3b+j53EV7d2s/YfIvD1+6WkC+DBVup9
X-Gm-Gg: ASbGnct5wsXR4JeqeuDWWjkAlMvcu291414w7tKmhpaty++zjiQhUwX4SwpkckUrU0D
	j4sV583f9EodjkdigruWVendGRX6n1EdURGrTum91IuelNwicbkN5UQfiNLDPLs1znONO3cywlC
	K0GXCF95y7JuMogt14fDWS0lch8+fGFZvJi1jKul0LPu6MYKEEC+xl+K/4M6n6DjdJYie1rmH/F
	D6r+CVN+ZGjFLH6YdJfapUXnBGqRlDZ0Gp5fC9jBdRRdIR+67zL3+XytxZ7xOab+/IEzQigBu3w
	4l6LIPOUXcwx+rUBc+T+p4vhypRlDxrAiETzrnLBXqPoWIoK496R8XJh2OLa+lTlfqX09EOOUmq
	vxnJOaOsaLVad8mkKFMf3jcR4tNw5LKmugXeM5+lv
X-Received: by 2002:a05:6a20:2d06:b0:1f5:5ed0:4d75 with SMTP id adf61e73a8af0-20108139fbamr29100386637.31.1744092411712;
        Mon, 07 Apr 2025 23:06:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGNs6YIAjtRMwCSgr1KcB95nwYEiAKpz4GyZD+0pmYEVFXHVcTPMA7Lk9EKDFmHiBoEw/Jaw==
X-Received: by 2002:a05:6a20:2d06:b0:1f5:5ed0:4d75 with SMTP id adf61e73a8af0-20108139fbamr29100341637.31.1744092411321;
        Mon, 07 Apr 2025 23:06:51 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:06:51 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:31 +0530
Subject: [PATCH ath-next v4 3/9] wifi: ath12k: fix failed to set mhi state
 error during reboot with hardware grouping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-3-95e7bf048595@oss.qualcomm.com>
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f4bcfc cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=zZIk_WvpsQkbQcpLs4gA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: gqVIvGbTZKH7Ru-52_LsOMpTyxdh5e0T
X-Proofpoint-ORIG-GUID: gqVIvGbTZKH7Ru-52_LsOMpTyxdh5e0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_230653_438927_D741900B 
X-CRM114-Status: GOOD (  13.02  )
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

With hardware grouping, during reboot, whenever a device is removed, it
powers down itself and all its partner devices in the same group. Now this
is done by all devices and hence there is multiple power down for devices
and hence the following error messages can be seen:

ath12k_pci 0002:01:00.0: failed to set mhi state POWER_OFF(3) in current mhi state (0x0)
ath12k_pci 0002:01:00.0: failed to set mhi state: POWER_OFF(3)
ath12k_pci 0002:01:00.0: failed to set mhi state DEINIT(1) in current mhi state (0x0)
ath12k_pci 0002:01:00.0: failed to set mhi state: DEINIT(1)
ath12k_pci 0003:01:00.0: failed to set mhi state POWER_OFF(3) in current mhi state (0x0)
ath12k_pci 0003:01:00.0: failed to set mhi state: POWER_OFF(3)
ath12k_pci 0003:01:00.0: failed to set mhi state DEINIT(1) in current mhi state (0x0)
ath12k_pci 0003:01:00.0: failed to set mhi state: DEINIT(1)
ath12k_pci 0004:01:00.0: failed to set mhi state POWER_OFF(3) in current mhi state (0x0)
ath12k_pci 0004:01:00.0: failed to set mhi state: POWER_OFF(3)

To prevent this, check if the ATH12K_PCI_FLAG_INIT_DONE flag is already
set before powering down. If it is set, it indicates that another partner
device has already performed the power down, and this device can skip this
step.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 7f1bb150f326b317157f6721d990d61a27f38d6a..aae1989c686bda37c12544e72338bbfbc5f75042 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1487,6 +1487,9 @@ void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
 {
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 
+	if (!test_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags))
+		return;
+
 	/* restore aspm in case firmware bootup fails */
 	ath12k_pci_aspm_restore(ab_pci);
 

-- 
2.34.1


