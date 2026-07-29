Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3975C53219
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 01:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7OCiOhUvbS8MmL9dYvzzL3m6qD2Zu/mwC+MTVmjD4g=; b=mXD7ePXzPFsyTKegWy/52WIHVz
	5qK+t7mBcXYq9jMuVKYKGi3eRJNJqQ7CiagBKW+Myeyg7CHE8AVtvHox+qT6TqvM/gnsP87tYFopx
	dguoQQDZA9SCEryqCRpzk/1ikyxBSZj4Y9SYZ5oeoo+iR/xboOUiENC4mozHM9C1vKf2+Kw6I60aA
	oqXv4/sE8eY8Ocvqo8gM/yw89BH+vU1lqoCnL9UKcQnGSmvLvus0wqIgIou3+28XY+Q6NprQGx7v9
	mU6qZ5ALUEXp+9BqbP7Bnx/5AaxWMS9ybfJMoymQHg/4bA/IJZaJzsEp0/u4QdRCHahApAAAtZa6z
	5L+rrlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosjt-00000006YZz-2cTi;
	Wed, 29 Jul 2026 01:05:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosjo-00000006YXM-3Qfs
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 01:05:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL2wq4909612
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 01:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7OCiOhUvbS8MmL9dYvzzL3m6qD2Zu/mwC+MTVmjD4g=; b=CxEtqH6n9hiyd44x
	EQGqVmBZKFsPX04IOP1SV9UL9cS/ATROLB6TyA1XKjJRB8P9jt95+cKa6oQiSw1s
	uMqHxlNACwVs5STz4UBnE2+bwMI7QGt0Hb4AOC04MvZS2trqlfRyPAlXrjongcjq
	ah9G0tBAccVMgtkTMcP11al+8a8sJ+h5xeeUVmPwdlkrg3H2spTqK3+QveV3DrHK
	n4iCgpQul7tydTvpK6khE7Pgc50U8Fa/WSqb8iRSQdnjbjeWgGZ4BVjHgE92qWHb
	BZL0Uy5mX8VhXMnRhA70jC2LD6M7mVrC6bnjDQPElLa7Hn0TrhGl5qTn1Dnlp08j
	SVXzSA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvxxk4nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 01:05:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84865f326efso469426b3a.0
        for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 18:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785287136; x=1785891936; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7OCiOhUvbS8MmL9dYvzzL3m6qD2Zu/mwC+MTVmjD4g=;
        b=VK7oE+4ggGtjcn05ekdI0d2VZtmVcLcg1dfQ4y1MF5eNRdLig8RGYl0KHA0BA2bZq2
         j3UDag2DargzcUxHIH22dwqVlju0dpQz5XdoCJ0f0oNpsDnFl6ovCZnk+XPLmwbQfgGY
         bGUNXNGGb9bx6et3pcZ7ZldlWcYlSf7+WoVZ3Zx7XQDphLSIsrOrrRo+2ljMzUfPZCpO
         sI7rR1lqO7q3EVhhQJWnZcpSk74dH9l8aOM5TiBcaWOmSJqivJdGDrwTR22yMJJNiBim
         lJZR7ar6z+4HsToXre4GzGWpyfVnMQvEreNO10GaV1+VqNZnR+jZyWnnRCPvRzp7uPKL
         /M4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287136; x=1785891936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7OCiOhUvbS8MmL9dYvzzL3m6qD2Zu/mwC+MTVmjD4g=;
        b=SxZvI8eft5KiBqRcNjrm7sknKeK77rYaNOc0p/fGQND6R7FQ7baoF1fyHrFDfqpJlG
         5n1duD3HFejQdYVuQGAA74XIo1WobgmMQA9Bt268BkvAZ7Tbj7L9izOKUCtUbKuUfmab
         QKC3u0XdvcHUWBgv7//GRyjdQjiOvxhCLtvsxr+Q8GP06nvLUR7QtCOpn+CzVA8sNiFC
         gu7XoVKNg06f2JTeLNUO8xvRwCKStES10RA5EeOI2qQJv8Y9zihXK3zjA3tGx6p+nAxF
         E4WtQRVIf4FD/DkWLPc1Yj399avFwQrKalDLjzWB+gv1y48GOjEnmVjFj9abu38pnxQl
         Y1EQ==
X-Forwarded-Encrypted: i=1; AHgh+RocN+/vWp2/4zMGY+2AfNm4fhG/55OK4QJ6rsKcY7Qi0hgFC5Le0bfilG5w2peFsOYskCUduVI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7AFWysBx1s5ho+XznZnpiqvYVJhR2wLWF5WgBVbA3qSOz8e2s
	YMSEXV3yjUAa9yb/ylaAGhS+b2c3V3wuJymdSd05foXtHUX4CTKqZt7BSx+xvKW3xK+y6NWR21a
	oosGujnD4O2HU5OYE1ULpsR5JepHCU430T5gWSQlj2ygCFpLOA+qJZ/tzjERm/w4y
X-Gm-Gg: AR+sD12QdSfJ8nUyOLB27bkN4tEqhgsFfqvyvnSdwEhJtJlZ2jy3OcdDQvjiKaPdik2
	YjCAoeJcDFvf9g/7EcbyZwH0UPMo3Gcb+pOk5zPTvDT2ksR91eOfbVbxgeeLbBfov61pxbUdf7/
	Jnuae2qavvSJKPnEb61uT+/5fZI64cNQJorzLvSw6fxhD9Mf89dKGD2YUqhJOQJZWFkKouUtums
	7vhiPdfu9GAIESTm6Tt6D11Yyuo9q7VtDT6JAIrVFajDF+PQR8rVYirJDwOLAVVfqXIjl68tQkH
	VO2xVkqmTIbD0LIZe4mH/MUfzCu4K5Yoxo/OlT/lXQ6LGs0QAlJT0ELtl4jN5/90AtzuaCLoWoN
	LX2PRuN2qYV+TYjqn2wDB+ExZeg+2sSYDs3npeYhkQ3ubpp/zxmSrQ1k=
X-Received: by 2002:a05:6a21:a85:b0:3c6:5723:5356 with SMTP id adf61e73a8af0-3c8ba63cf5dmr5963979637.73.1785287135740;
        Tue, 28 Jul 2026 18:05:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:a85:b0:3c6:5723:5356 with SMTP id adf61e73a8af0-3c8ba63cf5dmr5963939637.73.1785287135320;
        Tue, 28 Jul 2026 18:05:35 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b67063sm3699381eec.9.2026.07.28.18.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:05:33 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:05:29 -0700
Subject: [PATCH ath-next 2/2] wifi: ath11k: fix stride mismatch in
 mac_phy_caps_parse()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-mac_phy_caps_parse-stride-mismatch-v1-2-27a9c1a3fbd0@oss.qualcomm.com>
References: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
In-Reply-To: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX0T1yMtYNIDgZ
 MNDp5WEZTpj5H4n7RGY0ySGmzK2pP0QFIfktyQFSgxmfB7K0JHaCFeByUHWHkZONoln2uPcIzaT
 ABg/jJtLmbVPK3/tn97gIzybBoF75fB7JhLPomV+LnOl9wL1Jxk9xOEOxgkH3dlHN9qhp2mQwfe
 6gBw0lJ7SlC2d23hBlccGe58IdLB9WXaXNLHCekYooGNnR9SL++bV2WdyxvHyPQMuEHASgauIUn
 UHQgsoJ7SDCgWNv+kkTz/U0WUtrCBGgZuDFmmWxdsW3SNg2d8NMRuBEX5739iKtBtrPD3LUrG52
 iNxzslcPepVWxy2PnM6Alp7Z0Ry+k2DwtfuAkw6TxDQGqf81UBzdHcRGXHUOoDID1JR0oYNT2eL
 iOUm6S1FUujhFSGhBpfs8okXWQz6LYUS5z4NEjyTdvYomtWoAkXjAI1cut2MiawQL1GiaxGZ++i
 rsYr5Aq8d5PudtpmjkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX3hxBRRMWDdDR
 xEtMNORSoMBdzxjMIFFFv6zMZBQLJAiBlWpdcOIvZ6v/ciYG2EanwayawUGzqVmpRxBMpQQQ4NX
 /oLWaCY0OyFe4p+W8bw9A1v6lGxDJZo=
X-Proofpoint-GUID: HvdX0jNDU6xnfsPbSHaqUzkFoFVVincL
X-Proofpoint-ORIG-GUID: HvdX0jNDU6xnfsPbSHaqUzkFoFVVincL
X-Authority-Analysis: v=2.4 cv=PeDPQChd c=1 sm=1 tr=0 ts=6a6951e0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=y0DE-vWUm0S5MY-z67AA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_180536_865837_D0E92484 
X-CRM114-Status: GOOD (  13.49  )
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

Currently, in ath11k_wmi_tlv_mac_phy_caps_parse(), kcalloc() sizes the
mac_phy_caps buffer as tot_phy_id * len, where len is clamped to
min(firmware_len, sizeof(struct wmi_mac_phy_capabilities)). The subsequent
memcpy() destination advances by sizeof(full struct) per slot via C
pointer arithmetic, not by the clamped len. When firmware sends short
TLVs, the second and later slots are written past the end of the
allocation.

The reader in ath11k_pull_mac_phy_cap_svc_ready_ext() also indexes the
buffer with full-struct pointer arithmetic, so the allocation must match
that stride.

Fix by using kzalloc_objs(), which derives the element size from the
pointer type, making allocation size and pointer stride provably
consistent regardless of what len the firmware provides.

Compile tested only.

Fixes: 5b90fc760db5 ("ath11k: fix wmi service ready ext tlv parsing")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2d2c6d7a4a3b..f80e9b4a8a39 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4800,14 +4800,16 @@ static int ath11k_wmi_tlv_mac_phy_caps_parse(struct ath11k_base *soc,
 	if (svc_rdy_ext->n_mac_phy_caps >= svc_rdy_ext->tot_phy_id)
 		return -ENOBUFS;
 
-	len = min_t(u16, len, sizeof(struct wmi_mac_phy_capabilities));
 	if (!svc_rdy_ext->n_mac_phy_caps) {
-		svc_rdy_ext->mac_phy_caps = kcalloc(svc_rdy_ext->tot_phy_id,
-						    len, GFP_ATOMIC);
+		svc_rdy_ext->mac_phy_caps =
+			kzalloc_objs(*svc_rdy_ext->mac_phy_caps,
+				     svc_rdy_ext->tot_phy_id,
+				     GFP_ATOMIC);
 		if (!svc_rdy_ext->mac_phy_caps)
 			return -ENOMEM;
 	}
 
+	len = min_t(u16, len, sizeof(struct wmi_mac_phy_capabilities));
 	memcpy(svc_rdy_ext->mac_phy_caps + svc_rdy_ext->n_mac_phy_caps, ptr, len);
 	svc_rdy_ext->n_mac_phy_caps++;
 	return 0;

-- 
2.43.0


