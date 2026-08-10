Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7225CC5AD55
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 14:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRk+1Rwpfg+nLylheZltDzyyCE65fCZN8pVLsGu0DbA=; b=tXAAlJvUiExpSsjDvC+tIcoIDJ
	Ohw4AqiOnOu+z2zzy7+DdSdZEyP57yaA4yxGcZyYxdhPEd8eYHeLkNd64xIsY7GufX6Rt224M1JDP
	QIq6jjzHtav3Q4uBVaT9vlFTHT1E0jQKMqQPFWlfgib9rnKtObLb8Xz0/LZHo16Jk1bW6LXq2YYXk
	2Turk3vYcPI3JWdCXC1HRmWTDGjeRQkQ5vgQrsmsvEut65+8FOY36jrfaqEbaC8SJNuwmEnsAS/9v
	usu5uPouFLj2wnBzqx2Tlo2RWUzGrH9cYLqKDXddsIp+Cb5aawKTjfxVV5m4HttMa9tLZLKWTQhr3
	UOSi4GJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFj-0000000C3VI-0BSq;
	Mon, 10 Aug 2026 14:45:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFf-0000000C3SE-1cYh
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 14:45:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjAnv1367874
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uRk+1Rwpfg+
	nLylheZltDzyyCE65fCZN8pVLsGu0DbA=; b=E0FzOElP5GTVF1ZvtOiKW+vA1cs
	bo0djud5JzGUsAgSS9NEOpUf9ggY3RXHFDYjj6sVyFvhjaW4eRFt4SCsojtSLVtq
	ruUmaYNZc6JYSa2CJcoj+kXcIrjtpdJQh9d5KJIfNjVoO9XdHru4B0OOraeDAYEK
	8qKfomTkGwBf4kc/a6ImPZGz1Y4baWSj0VqyHiBUQC8iqQZHhR2kJX6Rdo99k5vp
	ElMXCAPf2Va3Cfn0Gaw/4wXGuPGXRMPywkDaeL2rT90eDUKcrF76Ed/x02L2XFMa
	tIN+kaFTgwNYepXnWLFv+h17fPKlAzpIESasoWXQiGEJxrF4ZXHrp/ykmWA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v4a1jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:45:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so31250015ad.2
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373117; x=1786977917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRk+1Rwpfg+nLylheZltDzyyCE65fCZN8pVLsGu0DbA=;
        b=Y5Kp0gLfyC+6DYZeiAC1O5RPjtdCJP6+dkJES3YGVQBWpfd6xs0blNFaMfzLh84SY0
         +IMOVoEOYFnmoXiRN3e5bgabdEA7ASoMNcdvwGMNbRswiD4P+0V5bAaMyb8cxNXdo3e1
         H9Z/Lk7JCF5mBUGgK3hKTTneLFhkwrV42HnoGmkF13DlINDfcqEUXbOrQybXeQqTb9g2
         AcmU+NdUn6GOK700WvQBAXfoyjNJ1k8ATTnvnYd0onXtvzR0q2rsWLdqQFxhS2Yj/V52
         q2BNCityk8AQMHi6eyOWt7vM75ILN8EmUotkQKk7yRka5VBzJ0R/2yWmvicvkwBirUOG
         5VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373117; x=1786977917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRk+1Rwpfg+nLylheZltDzyyCE65fCZN8pVLsGu0DbA=;
        b=IfDKe0cUI6VCB7PQTy1muGX8zvu0UW3fWKDtDsEFaigyUBbjSDy5n2hO2os1vskude
         ZtkZ7gpQD1sEsgWWzCMWn5VcA/+BA3X0/iyuljzuXVfDC8x0aDXIa1bHxRRx17RZxJYg
         7/eveM8eCNezGFQ+9pedhCXgyMvAGkVSu+SdOJc5/grCcT6vfDgv2g1MrNtpbtgjhBSk
         aVhK7ax6LXsKgj5RqpMm95HU5Hgx2btYT2JMpd0shB7Qsx0bDO1lF8fiz+7/Bfk0QO4V
         61ETqUwykA7nSjKm8ReuDiXtcf/8toQmrtr8WjrDcFl6WnJ4VrqM2FGt857IdClQua+a
         shMw==
X-Gm-Message-State: AOJu0YwN/7Nct7YHb3r6rGbADEpFXo7oJX6Tkz/Oxt03ywSfsUJiUJMT
	yrUvckXuyLiYTivPo9wKUSeoqiOnWguqlGieogTrS1vCu4utjbgx79T/OFvkp/nYgCaEhBOdUaM
	zp8Lib2+G/DX3Aqm/TiSTRWwUlaIgmwbxpYdJ141bD+h6YuTU10tgTxVc9nOZdouZH7u3BH1l
X-Gm-Gg: AR+sD10z1wwgEx8ocpMvMv4nTEaP9cThAhUlt2AkUmzJ4FBC0fK9Jlxkht26hmS6hZJ
	ncStGjXWyOoMk838eLOGMNFgBaXGy0rm53Qnf7C0d59eNFcp1+JSU6OcvxyVaGRaRHdwp9YYQVQ
	ttH1FNEYrFkDJxO6x7tLWUbjtgmiWiHs+ROsidrpOFcI+i/ewk+2O4/imq9E/lGHYhbCoYNphRT
	AS/Rm/P7GPnEtiCPeTKk7LhtQWgUoShUALdjuVIo39w2ns3Gf1Jjc69AJqxRd/JC2vVqdbtyoKY
	ELjPQaxJfYphwC772FYYTsedTwje8xYpiWjFznkmimIuqpjoCH2Sqy+cO9TuSSl93CWpO6T00Ys
	ck2Zz/+idMPix8GM5NrCPV0+ise8BWvIpzEsDh2Ekf/ofRSKUNO8D
X-Received: by 2002:a17:90a:e7c7:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-392cc961c23mr1716873a91.9.1786373117292;
        Mon, 10 Aug 2026 07:45:17 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c7:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-392cc961c23mr1716832a91.9.1786373116798;
        Mon, 10 Aug 2026 07:45:16 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3926254ee45sm12797317a91.2.2026.08.10.07.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:45:16 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v3 7/8] wifi: ath12k: fix 1-based ring index in REO Rx Received debugfs output
Date: Mon, 10 Aug 2026 20:14:43 +0530
Message-Id: <20260810144444.2033607-8-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
References: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dTY_6uArM_Ti6h0n5FOXYkJLFjiTvpFw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfX8W7WY0TFwgve
 SnPNAmbdi7b/3yoYSwLvKNx/KrVtTnRBF5yXw+LvJjrtzQg+3tCxP33QJelN3gvSesxwyPWiJQX
 nNa/YHuDTmTw800Fzua1AiiwgKpr7KE=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79e3fe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qz0A3ntWxt9h8-tH59wA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfXwbFGevWOuMxj
 lP+IK+dZOIHUD5FWIQRSj0b2lbNEJ+KwVPv4TsbA4XrkQ+b3Ud6IDd+CDihVvK/1sbFjZajTLUK
 ncL0O+wSKagXY26iXkZ8uLeFn0vfH3O8ZscZvFTwBkY97P6R6+QfpkJs+D6y21r2HlM3XdDA/es
 ihFdnOPHLkwJZPj93aoheir1vIf0vGEvpGhRvB9FHu7tbbcQz9QsCNcb6GdM182gahb+7cbyoTc
 BkjbiHdTxkfgOhuz31GoH8XAGDwxA6vy9mRdXn/sCmftgGwbc54WgIDcKTsySuo4SU7h1yFUPjw
 DPbu7TE1zLGASzrn99ttGO2XVHqFNtcMaj7FM0qRWgTGI5sXd5qnx7jstJoKbDRpiWhyA+rCCpf
 X7Y0n6//mXwPI3G+9BwI7iTWOS+iSD2PN4G4m9ffvponVx98zCXmel7tNjP0K4goy7+dz+7g/mK
 6kG6xfpYSvMS+pdJ2+w==
X-Proofpoint-GUID: dTY_6uArM_Ti6h0n5FOXYkJLFjiTvpFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074519_565906_4812D55C 
X-CRM114-Status: GOOD (  13.67  )
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

From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>

The REO Rx Received section in device_dp_stats debugfs uses a 1-based
ring index ("Ring1:", "Ring2:", ...) which is inconsistent with the rest
of ath12k where rings are indexed from 0. Fix it to use 0-based indexing
and lowercase "ring%d:" to match the style used by all other ring counters
in the same function.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 55e3b411d108..fe513b3489bc 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1215,7 +1215,7 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	len += scnprintf(buf + len, size - len, "\nREO Rx Received:\n");
 
 	for (i = 0; i < DP_REO_DST_RING_MAX; i++) {
-		len += scnprintf(buf + len, size - len, "Ring%d:", i + 1);
+		len += scnprintf(buf + len, size - len, "ring%d:", i);
 
 		for (j = 0; j < ab->ag->num_devices; j++) {
 			len += scnprintf(buf + len, size - len,
-- 
2.34.1


