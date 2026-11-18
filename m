Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB76606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 05:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NgfDfyR4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=deZu2fIt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fxpnsh3I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SZSn6jqqCbjR5xED1jE2r9pXU4GxNIb4gnfzuH54iis=; b=NgfDfyR49+/z4Q4u0m07MXMWDy
	C4WrHp72PWSTWTGexe7/tCB8tKJAYnbS8gKmYl57BdWMT9aXn120ZHnYawuC+Ui1t0ifG6aXBkyYw
	D8X65bXHfVh1QQcn142ug3U7r2LNI+QJ50I0qEKLV3VI/dDWmeFyPjUs9i0rtedg2S5nvht/OYiS8
	q7TnD+ZqZ1Jvgyubc+4FJ0fgR54XP3EZ9tYN5f7vjVeY9WfD/U8AmSODzFUjubU9nBmTz+1bD0/Al
	qnAK46jRVl2zuztS92ZNbgksl75Jiu8r1ikBeTkomO2TBqJQxHmLWrFVzPL7gaEFfFufHKII85Mzu
	wxI+9aQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTXmj-00000007jCw-0w58;
	Wed, 18 Nov 2026 05:00:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTXmf-00000007jCc-3c41
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 05:00:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V17T2106311
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 05:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SZSn6jqqCbjR5xED1jE2r9pXU4GxNIb4gnf
	zuH54iis=; b=deZu2fItin5742SkjvQ+Mtim7LH6zcKcg7MCxyTmJtObinmjfaz
	t+mNuEyMBAixjC7pZ0GBipbp2PO0vOSUaR/5BJ370PoavHXEsvsQew1S80fJOtwu
	CxNnuvLiSChefz6VBL1laqVFGNTWJf/GSZIttjIBvCTTJwqkTb2vJESOE/pNXaeG
	RioITpcCs8IvpKOJgGkIvg1L++gOivxfkDAF2vdz3Ntwku2s7ZWIAGjOH6FfdLBK
	ozXe4STqxf8UhUDD5ZGCZbvqXIYATEAZoxyRUqhdkQrCS5kNTgb7LpUt7ZMBYqXI
	4MZ/TRWfMDXK1t0SqFbyY60DtmAXJZa+S2A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8s888-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 05:00:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08be1c84so8207375ad.3
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 21:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794978034; x=1795582834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SZSn6jqqCbjR5xED1jE2r9pXU4GxNIb4gnfzuH54iis=;
        b=fxpnsh3IDgwQZJeuR7G2ntQ6eUekgZDSYvoe+HXnXoQPfUbvuJdAa+KqXGyQ742HWf
         Z1x2n3lMmYSGe2E7xTNC+H/3w2HFdxqI7PMBQomo2hpsyaBHaprhpWapb+RzVwHMmt31
         XBBxMjNWFkQ1UP6F8T4xd5TG9kCabzGyg1xcNSdtwT8DxOnyzPXwa1pZWJeScLKEuExD
         /ZwcUg2NxevjA5Wgx6BJaIIObqCDbQORqoENGOtBDql0MIg2c2UsQ0/iDh20gU7S0N54
         fJyGriBR8l2BnABwErXUi+iyxs3DaWUI0gYYVJK7/br3MukJijgTvpZUEG8nmlfb2+CM
         4DCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794978034; x=1795582834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZSn6jqqCbjR5xED1jE2r9pXU4GxNIb4gnfzuH54iis=;
        b=J+yjd7HJxu4AbV6kIm9z2buJs7ZT3aI4hQ/BWXewoMY2S/AT7oJpuiEPgPurvkXrpR
         9j6O08uc8LJgaRTAij9ywlhYeIvpWjr5ivzJ0UgvZ3sgntQcv4s8IxD5KmB/E6bHbt/R
         aq7lZKm1NzfpoeAP6i7hZcI2IME9ufFApw2NiKK4K0WVgWXpISS+5RVfctamNJGZbZbL
         qEmtb5qoZ3++m2oBdSX7uX4esiWwYdEilnlIFaEOF5YxMwton3tG0BL7ZnGdqZtejpHw
         XEP7Gc4URRrnFfqJI+kxv+HjMNb8Alk898ZjxCZG9JLRrxHp9XsEBsDied9wBlXt4lWw
         1g8Q==
X-Gm-Message-State: APuU4Z86IaPDW0yQJESqNEFz0WT/KGdGwEUSjDMJ2zN7lCMtPCWrqm6a
	Rwc4iFJXa+a9lYts/Lk2vqjLVI+w6mppBXjtSBVMwXbjC+MuAIzr1qraghxEALgKGcIeoGFo9cv
	30PPq4qpDnaBZsnU3FTGI/NLeooxqFwzm2zJsho3VE5ungZnW8fjf+DmCVItG53M6mUSq9HbV
X-Gm-Gg: AZFdTZcv5oNSAr+FxWSKYUnkuTOJt89X+oefRaQvKowMJoOHkrn1Dmmuruve/7S/aQc
	J4qkEb4h/laHfabRt/phFR2ga/2jZlVA+EcFb0EQp2QfhTt0yLVNwSkhjjBdi92ZKgVt0E5XF11
	Aun/MzlQz7TJRXnVT9mQZheIe+T0/rRUGaZ4nv05WAKTVccMJrOI4FdGOXHLFlxypIMoV3dtfey
	xCQC7hg/LnYu8iAPAUohPC2ROINbuAa/MrPcRTXyklvXHGue2rVhUrzMaKcXxgpZADnxEsvw78d
	JMfxmNjPejUnoTTXs2WZXtuxbtC6YvKJE2EHg6lOEhY/p8rE/ov6E/86vLCJo4vVuSbfvIL+VkU
	eXlporRuyPJIBE9VJ1X+ZxYByP573IvO+HHe7NZ9DEd0uILNwTIXW2Ajs6btU0dCGsHmlWrurTK
	LWfR6/d3yGBXK5G3IZyN6n0kmI21pEXjtMWg/kn51HrOUFPFCzKeP+BkHlQo2NtdOJwZrJ
X-Received: by 2002:a17:903:32c7:b0:2ef:dbee:373e with SMTP id d9443c01a7336-2eff7206536mr16697055ad.6.1794978034412;
        Tue, 17 Nov 2026 21:00:34 -0800 (PST)
X-Received: by 2002:a17:903:32c7:b0:2ef:dbee:373e with SMTP id d9443c01a7336-2eff7206536mr16696795ad.6.1794978033855;
        Tue, 17 Nov 2026 21:00:33 -0800 (PST)
Received: from hu-hprem-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62d0068sm6297805ad.70.2026.11.17.21.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:00:33 -0800 (PST)
From: Harshitha Prem <harshitha.prem@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: Harshitha Prem <harshitha.prem@oss.qualcomm.com>
Subject: [PATCH] .mailmap: add entry for Harshitha Prem
Date: Wed, 18 Nov 2026 10:30:17 +0530
Message-Id: <20261118050017.2334721-1-harshitha.prem@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UR0nmYteTv-NBADBAMCqJn58zWI3rvfw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxOSBTYWx0ZWRfX4XT7ZiHhR57i
 vZwOTWoE3fGthwt3oFHAMytuOs/Y1Jy53fsiTPHZdFv6agCvN9ZsbSxTS+9Orssr1eXDvNyVVPQ
 2lJikwQuCVxBzc8u/O00MAWQ1ppgCZA=
X-Proofpoint-GUID: UR0nmYteTv-NBADBAMCqJn58zWI3rvfw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxOSBTYWx0ZWRfX6IncGadNaHuO
 CjKj5Ghc1CQdUcYVJ85dBica6E6cNpV0uovlL/jDssQZ4gCFTdfBev8tMNwdSVJPaTDpwokKWHI
 4UxdhQ6quemq8wA6GXNh53Nrvm16l/54jwbVuX+2Ws5tBapKVo0gHMvlCRAVVHBDAzd520/uQIc
 PJsN7OoqVl6sCiifEvcI2DLu/+YhrFk/v7Q0kvbITMoAko+JvuQbpoIb9btKpKlJF0XTgkdldTT
 hZLri4yIMLcz2HyfcSo2R00LTW0sgpVT6h5vLGD/0OOuYleAT5BJ2CENRI6Wz1053p5nXEyQrne
 apw1rxX09UWDfEr8REb//Gz4fjaVqZngIg4FgLYP1DGmpg7iWmHxtG7UpfzRvjdDs7sY3vNoFS9
 jPJHmAuGm3j4IN6lWNfRyQX54IEbcYIai18ILYPayCh0EntFnerGyK1XtfsYRRAtC+XLeEPiexR
 tuQlxJXxh3D1FYGnsvg==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd30f3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=yjU-xTemAAAA:8 a=utn1Oq1yAAAA:8 a=yPCof4ZbAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=VnNF1IyMAAAA:8 a=qqoseQYBAAAA:8
 a=Xj2UY91FKP4IeG8XgbQA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=SwQY0DHxSCHDbjv2szoi:22
 a=xlqrWd4PSEjjFfj1i-r8:22 a=TjNXssC_j7lpFel5tvFf:22 a=GnkCqeab3kWf2iBCaA9y:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_210038_039961_8DDB46B8 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Harshitha Prem <harshitha.prem@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 847928a2a715..cc7f18b3f4cc 100644
--- a/.mailmap
+++ b/.mailmap
@@ -379,6 +379,7 @@ Haowen Bai <baihaowen88@gmail.com> <baihaowen@meizu.com>
 Haowen Bai <baihaowen88@gmail.com> <calvin.bai@ugreen.com>
 Harry Yoo <harry.yoo@oracle.com> <42.hyeyoo@gmail.com>
 Harry Yoo <harry@kernel.org> <harry.yoo@oracle.com>
+Harshitha Prem <harshitha.prem@oss.qualcomm.com> <quic_hprem@quicinc.com>
 Heiko Carstens <hca@linux.ibm.com> <h.carstens@de.ibm.com>
 Heiko Carstens <hca@linux.ibm.com> <heiko.carstens@de.ibm.com>
 Heiko Stuebner <heiko@sntech.de> <heiko.stuebner@bqreaders.com>

base-commit: ee7edfb99ee26581633fabb0662382734ea3cdbd
-- 
2.34.1


