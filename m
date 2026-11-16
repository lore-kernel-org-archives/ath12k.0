Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CB6606A32F
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2eAEfxTt;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BU1uB5R3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXZ0MGrc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AMeBssSVxGDAllv/UBRKUdYitWIeLAE1BM8oJAWmp2g=; b=2eAEfxTtI7Qv/l/fB11F3euXEp
	VEOdOJSeSshcwJIQUOdtrq5WP09TWXR0GKSzrPhTfDY7P3dYwTy3f81M4gzhL5lr1sWARcP//z1gl
	bDWyKDeZ9WCMlXsH0y3+bHjTlrtD1DZsYInzD7XBb6hPsM9tpcsECZhmhLn+aYrcPqypXaCAvXhGB
	vDuu/EVQiLVmJPVFrY3vfO4C+oqgTcBDFWfzF3HX398SNq515jCkUtw1yFXWyH6tqA/W6+aJOWGv3
	8nEpQhUb+VdJKXwatOYkI8jDPdAIX6Fn7uUmidGxO/a1tpG4CqaMf88FzyyIk2l3swBWPdOYUGVsP
	TdokvvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsgL-00000001iIk-0hLs;
	Mon, 16 Nov 2026 09:07:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsgI-00000001iIB-2J3O
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 09:07:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7eoHn1894903
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 09:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AMeBssSVxGDAllv/UBRKUdYitWIeLAE1BM8
	oJAWmp2g=; b=BU1uB5R3wp4OpeY9+6XOmnp+krCKaruG9+N63KtL9AM0Ke3JK2W
	dBKRRr1/egLzYw6vL+M6YwttfpB9CZk+qNHkG7K0we3p6izKC3s3KwCkr5m601ou
	osGoM7Zl3EU43hVwzss81ly6LDqiGwdk8SZAIchAlLQvmPW/4SG9l+9SPNa/cigj
	EMfLzJ2lLqJaB2WfdkxoSEqAQykn0kMWaaoCHejRrn97S5bQCm8UbnDphSdySpnw
	PKfXKeDSFj7Dr4JTrp02QHpQxNsTSH9hTdZM1XPujRSsXvZGVEs8i/s+GTsXYisq
	V6B37OgHKPbAetTgTh53NJBmsp9KkrSirqQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdwnam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 09:07:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed08904845so14963365ad.3
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 01:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794820037; x=1795424837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMeBssSVxGDAllv/UBRKUdYitWIeLAE1BM8oJAWmp2g=;
        b=EXZ0MGrcjrKd8dUy7e3C9RNm9lj4p18kQR6MIasxb+sH1vUvbkFXQqY/q6bwiI3wj1
         eezCP5k3T5or+cf3TS8SnZItbgsxYbtecSqYyQtLkKeQfcyaBVdwFdt55cK6gW9pF5Yu
         yT49lMfRvZmGV3LRBYzS6vwZ937bybEOnChtFwdXIYcW67qKTx6KPu/AwX0JycDo88vP
         w71CNvY+Fr4ty3YvLBhh+0bs4wZRD1mC2sHypEymPpakkAWoFpEOibvy23piklAClv8h
         IknNZzo9VKZNRcSwF6d2MpMDHqsSCTLV4eMH6Lb33P0SsnYihdPD5VnCYUpYH3rU+2nf
         2Ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820037; x=1795424837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMeBssSVxGDAllv/UBRKUdYitWIeLAE1BM8oJAWmp2g=;
        b=qb+V6LNIm6Z/IAsQ3ydott38PnSQJfsHXHQBJfvQ0Co6qtgJEoZXNAvEIugUl12zoN
         lhJzybSFq99QMyUi8hlaQTIGjOyDpK8OifCiRL0C9Nl/5/JsMfnouOU+Q7a8kKH/McmG
         4mP6hdjvyidniFAleuu9TKD+n/La70Qqe8f/jW0OEAoKmD4WPQsK5ShVQjQxiP2Twj7k
         9R13OEi/AxG/9WmkM0F+a5RpDrS/NqhNFkNAuk2IAQTnMBiRaDmaEEYRPEmtA8ex5cAR
         9rjJO6s8Ep7A54j9hjOuiIIk9VMEQcMXLevKTpys62vlbRzH0jFsvrsWbSKogk0htoJe
         XWwQ==
X-Gm-Message-State: APuU4Z/IbX1BoLk3Qq/xEk3h1E+XXNK9fpkMpq2we9xnXGY362JU/c9l
	IZBCWtzEKyCK0lCzf+iOqvlWIaVLAk5TJx5QMN6sM2qaj6d/8epUMxXZyuacEaJmSGG2cGXc8uY
	yXRhR3nPPe6t75XhLr7xwLBDcwh8MYghYJ56GeCUnTzgWn9ftZKnnN5baLBAT76Px+U/2pW2b
X-Gm-Gg: AZFdTZeUo/aZAJ6Umt1txuTfAO3ukZrU76Jca0MkyzY3PeGTCca5bpVhgN8Oh2YxpWI
	8KOBR8fhp/3fo+tzhDY6TUs0XzFFx13wQ9AQRNs54ulwS0OF49c3BhjkcZsiBZXSfSVswTZWlFt
	iX7bob6QytVwqjlNZ9ItUo2r60MeF4HGL+aUeTmn5QsFXhMXNjagf5iSamxG0c/3bYAUykysek6
	RaP7HPm54Cpl/LuQY/xSFYNwa1riudDY1i2iNWbBMy03ICf01NOQnKJF1lzjclepS8BhItx1/R5
	IuApIWyih254CgQsrD4NciDWbNL5GlVOLzqdFMo+0pTrHy0DQRGu4JXcCrG7o+gq/b4UKZnpUBj
	TDE/Z4GEg9k9znELAWsOTKtXqETlc7PP6WhSRl6h1IaqoMI0roWoly7zXdQYivr7hhK4iWnorQA
	pVciYUnjGyFdKWTggsS7hClPpNmrNmsVaqDo6sioTHLE0aFJEdeFSvlejMKitgMWaO5IQiQ9dZ1
	w9YAChv5tw=
X-Received: by 2002:a17:902:ce0b:b0:2e2:cc25:b232 with SMTP id d9443c01a7336-2ee0dc5b181mr103943045ad.42.1794820036624;
        Mon, 16 Nov 2026 01:07:16 -0800 (PST)
X-Received: by 2002:a17:902:ce0b:b0:2e2:cc25:b232 with SMTP id d9443c01a7336-2ee0dc5b181mr103942825ad.42.1794820036124;
        Mon, 16 Nov 2026 01:07:16 -0800 (PST)
Received: from hu-periyasa-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f862744sm34146725ad.44.2026.11.16.01.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:07:15 -0800 (PST)
From: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
Subject: [PATCH] .mailmap: add entries for Karthikeyan Periyasamy
Date: Mon, 16 Nov 2026 14:37:07 +0530
Message-Id: <20261116090707.3989756-1-karthikeyan.periyasamy@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afac7c5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=sE7CjSugAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8
 a=COk6AnOGAAAA:8 a=82irRftXAAAA:8 a=DfNHnWVPAAAA:8 a=vUnu9qf6cM3qBZzUThAA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=vEg5ttvfGov5Bh4Mdlh0:22 a=pioyyrs4ZptJ924tMmac:22
 a=TjNXssC_j7lpFel5tvFf:22 a=h8PzVwtbvIW0j_qOr95F:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNiBTYWx0ZWRfX37YjTCcb5x9B
 5/vrN9vjk0dSD/Enxu7k0CSFfPPvjzox6gn7gGT/I9TMBirrSquYs1b5U6V9pQzKvSrHpNND2Ed
 YCsdju2VAl2QOR7ERt//PRNM2lGzP8A=
X-Proofpoint-ORIG-GUID: Dicma5wJJT___l29mFU_Z9osh684xFPl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNiBTYWx0ZWRfX652fALL75uFG
 PNP7ZonfwFcEcNquHi1qwTE5K6zG1JIrYud8+b7zEt1s86AzHqnz2PSz2p/OttRx/Tdd6MzufXu
 TS4OrEsXHIUVb5nSyTYmvLRtNWNpOXzOaTSNlt3sxg30Evj71DCmqPvMlOqC+OeyuCgRMHFzij1
 Q9XQiK79d4L3EQ2fAEA+ureQnS9DY4PFWtuM3uKTSK/qsxfPItgptFoMumysDstu/pNl9YYq0ew
 Kcm2fb6maz98zvpjFYyLcOottE9abq08f0P1A2Nerd+himmd2AlMMI5JLTDMVH9PG66QKNhPM0z
 FbkgwNPKrBrPMavZ3B2Qo0Y9yrD8AaP/seP/Lzl46ojgBhsqlQqjyHC1KMdXG9b6khUbUmU45T1
 YMb/PYa1Ue3mGBiDtigKNJhKdb3dmZPOtrRFJOcE+tNWfJSH/8pbw3WtxBpGg7HtK83WTbYxzIB
 TnUIyjXLktX9xW5ZVvA==
X-Proofpoint-GUID: Dicma5wJJT___l29mFU_Z9osh684xFPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_010718_591411_4F482ACA 
X-CRM114-Status: GOOD (  10.23  )
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

Signed-off-by: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index d73ec73e5ba9..180fcac106cc 100644
--- a/.mailmap
+++ b/.mailmap
@@ -497,7 +497,8 @@ Iskren Chernev <me@iskren.info> <iskren.chernev@gmail.com>
 Kalle Valo <kvalo@kernel.org> <kvalo@codeaurora.org>
 Kalle Valo <kvalo@kernel.org> <quic_kvalo@quicinc.com>
 Kalyan Thota <quic_kalyant@quicinc.com> <kalyan_t@codeaurora.org>
-Karthikeyan Periyasamy <quic_periyasa@quicinc.com> <periyasa@codeaurora.org>
+Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com> <periyasa@codeaurora.org>
+Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com> <quic_periyasa@quicinc.com>
 Kathiravan T <quic_kathirav@quicinc.com> <kathirav@codeaurora.org>
 Kay Sievers <kay.sievers@vrfy.org>
 Kees Cook <kees@kernel.org> <kees.cook@canonical.com>

base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.34.1


