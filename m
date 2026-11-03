Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0945606D80A
	for <ath12k@archiver.kernel.org>; Tue,  3 Nov 2026 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1aPky9uz;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0Hilzew;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hew5vlMn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7WcHWaVy/MY/Uug0kH1jhCYe8yeKUPTCjdedoHBj4Jc=; b=1aPky9uzavdOBDtuHIv3RdpsLE
	kNSjJRW/G+biQuNyo2Bb/11YErYxNl2h9DeYDur7teHsPhgAyrehqzd7XM5Yge71qKkva7mXusJDc
	CQi3mM1VL4usWG0hqELTSXvbv943exse9YfAZxOCub7Mng+qJCTlY3buzvDMIltPQK/CrwhvftqBP
	5FeBt4TI5Mb9hy051RX+p5T0MwQxGH6Oq0u9+eZ+vmg72GIC5kxEnb8eylxluE0zohbHPc9O7SGa3
	0bIVVeniYDgul3FqEAhz5lBtqsCHE3jl7lqpoFIRDR7/NjU/TMXjx/SyAlVQP+euwI9VBIVWUWuFa
	VcNrGi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB0R-00000001mOX-0UtS;
	Tue, 03 Nov 2026 09:40:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB0K-00000001mMX-1P4F
	for ath12k@lists.infradead.org;
	Tue, 03 Nov 2026 09:40:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38M2TS2106677
	for <ath12k@lists.infradead.org>; Tue, 3 Nov 2026 09:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7WcHWaVy/MY/Uug0kH1jhCYe8yeKUPTCjde
	doHBj4Jc=; b=G0Hilzew92v6MVHzYKhdRR1T6oucmlGAkKRf2fkOt2EJYHK0iDp
	tG/cTxEaNRH2qiBAlQQ9ZSTOL7fsgr6/99VJUSaW6CEdDnpZZhw5Y/Y0tE1UFe28
	mx3Z0T0bRNwP9uDCvISW7iOgoM1mJ6lxlevWt3d3D1XIBnrxv2vx6MTlHtQ8XQBo
	cce1I2VFySXs+kjtvcXAj6eiWaDVQ+BDlg2NXTXefezxgSJMEkJrwy2Pl+jsrMYS
	fLXt5vOi+M5/F9HDnmSP8SCmVKSskT8gYdQSkFhtD3SJs6w+4TQBf9Y/m3TqbCUw
	li4GKJ5+4YU8qBysC/0KTK2VdXz370lDzZA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m99jr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 09:40:29 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8468290b866so5501375a34.1
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 01:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793698829; x=1794303629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7WcHWaVy/MY/Uug0kH1jhCYe8yeKUPTCjdedoHBj4Jc=;
        b=hew5vlMn9FI1tBscB3BhSlIZDpzzmTSxOWrYgjVofNbpa807XqdFhhur228vkEUmjI
         KzUUo4WDGe8hmohCeaP3Rab9i96n8Vi8fAugZAuqjDkL+ZUEraUJFf4sJAiagOmD/9yv
         i0cN8ipe+RncuWFKVAva4FEQAqo5RBvFHKfFie8GVKu/pr7egxoHMdYZRrD3nK23lM8b
         A+5ZwXMG8/6Dz3iYzZ0RPjboyANJHHTSvuzXORM7I1LMzQFOoAj3hqHxxrTvYahvaLk/
         J28KbWbn5KbD4ZigTuUZQ/5tC7cHDZB8D+1ZWhXsI+Vw91W1BHhqQVKO+a596aDmv73N
         igow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698829; x=1794303629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WcHWaVy/MY/Uug0kH1jhCYe8yeKUPTCjdedoHBj4Jc=;
        b=vhy8TIinHflZ57Kl94Wew4D7RPn+C1kJSFVD7Tdl/1pI6p4vKrsEl9U1js0iEx9a1o
         5qd9NppGAD9mc1scY14sXPrb/09wg0hi6TpMb0vEd2dL4MedxmnglpUX3y/QAiC9Sn6L
         VcXXpLan68jC0ReuEAru9NqcnrEd9vVLWOko6F5SM3bg33xjhRkcHmHr/gHb5Ahbx+0w
         UEAQ9DuE9BCAeEvBFHeTPVzCuhtt6LaMIKTKFy4VheMxyUoIXzN/AeEK4WMhipkbGYtk
         c3KDOcw6zJLIKagsFWClei4wDAfEFJjSIwlSdk/dQ/m+YDYdYdXObGeasEzc4tMPVjsF
         uMAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+JC3Kh8zga9WauEvT+CnIhtEEqNzCeq53A7joPZdVlISUkbOhDo7d/ZwJ/XnOj9XUtaPyvIs=@lists.infradead.org
X-Gm-Message-State: APuU4Z+K/LgAovsCD6my/XIDICVKsMiAzMvrFTT89Xv7xiDT9we3z4Vu
	9hjI+RiY+MfN9Sd5g2gjH9LmODwxC5y7MdkfopqRoanWyIgkqg9SKCBcsZqAE6SsCIERM23cS3e
	a2nu44ugoVKy+TV2nZME07VbCAGLecK5qIpRbTS6uDqNJkk0+sbjwn8pGM2qVmYm2
X-Gm-Gg: AYBFou3MEp4ZIVlOIwZuPLltjkzvxEtWIUZhZkERNRjaFzUNgR16ERnJJKNNK376QRj
	jUwhtnnW70+Vfo7yQYXGMm+NsURoB/k9Z2ba6kdvgOmsOlSSyA/aRxsY+9Bmfooy1gk8STQtqMd
	FuL23b9xCC5S6rnBXj9/uxLsr4eEWHBGIvisij34u+y7lv/sy615RhTF4/wcxt3/P9M4Y3Wv2rr
	ISrg7BHJYWZWQd9dQz1oxa14221JwJAHRldUWfs69lewNb3hfFnziBRH64kAmnas9l+tmDIcL/b
	KwbH7vBNwNLI8G0BqLZe/xtNyl18eZyy7Xl8RxNvq08KaEljJ8vX72Hivztscih4FNVegz9uLdj
	s9bdecPQq5YDhMBhM6DjVr6nPJsj5xGXOSrJK08vgFC8E+Og1b8CZBB7Dwomc5IlndElhARVCyy
	QCqdFfOLhFaiQoXz0hOTjN9qvFDvi7ndt1Uj/e
X-Received: by 2002:a05:6830:913:b0:843:56a6:c881 with SMTP id 46e09a7af769-85d3636ce61mr11809091a34.8.1793698829047;
        Tue, 03 Nov 2026 01:40:29 -0800 (PST)
X-Received: by 2002:a05:6830:913:b0:843:56a6:c881 with SMTP id 46e09a7af769-85d3636ce61mr11809082a34.8.1793698828668;
        Tue, 03 Nov 2026 01:40:28 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354f660csm11218241a34.22.2026.11.03.01.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:40:28 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] wifi: ath12k: skip hardware rfkill setup on Surface Laptop 8th Edition
Date: Tue,  3 Nov 2026 01:40:24 -0800
Message-Id: <20261103094024.1764151-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bxGbl27cVV-nF8XrLBHkspAfim0tc4NB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX1XAclHq8eE7q
 lNct/S0O3LrbJsOAMul5lVW983ZS5zxcx3luTwYOaXwQC8IHJhuckIpZRn7riCc4Ua4UCwIAcb8
 y1Xot8OOGtQ0ujXrfpuFSkUbr/jWoJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX5b/4oYNlV28Z
 UxbbKo/wnE95+8jfkl28p0c6Gsmu1FAB7Cht/cqGc7Aj0Ov44iMy87785ZGTVxRxgSk5nRFnW3J
 lst9iaZqTHvzwYo1bVpJPv9hcNJZnFND77gPmFngseu2Z1TMy91Eh8ENNEcwrWj8DUu6GybNYAo
 qMZKS3ppTuA3l8v1oR5470Ug+pOQ5nNuV/mLFBMWPKiySH0HzYGt/OBTG6gpYTCbddKgFyW8z1b
 db1UYZxf2p7bkC/pByvaf+Tf7jQxcEH00IImsVoM63Y3sIXL+7BDRxdB55Kzy0LzBjtD/tKwkGN
 99KSk0y92/qnBsBHG81s3NXgUciu6/GinLOcdCjNsQ01zaCoYWxQpibjC/N/gf/csTVLWhUnRrN
 O/lbIYmzhlY6b2rJIzk0NRFDL41Ab2x4H5sfgIA+BEUi8l68f26IyBoy6goswnkNSbwSd6TZMhf
 bLcqZMriVu3mYyiX6eg==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9ac0d cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=UtmVXepWBbLK2i_37A0A:9 a=ZXulRonScM0A:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: bxGbl27cVV-nF8XrLBHkspAfim0tc4NB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_014032_988027_DDEDF99E 
X-CRM114-Status: GOOD (  10.03  )
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

The Surface Laptop 8th Edition (13.8") has the same broken WCN7850
rfkill input as the Surface Laptop 7, so Wi-Fi stays hard blocked.
Add it to the broken rfkill table.

Tested on a Surface Laptop 8th Edition (13.8").

Assisted-by: LLM
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 25987bc58556..35a440742456 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -87,6 +87,7 @@ static const struct ath12k_core_broken_rfkill_table {
 	{ ATH12K_HW_WCN7850_HW20, "microsoft,denali" },
 	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus13" },
 	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus15" },
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,surface-laptop-8-13p8" }
 	{ /* Sentinel */ }
 };
 
-- 
2.34.1


