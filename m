Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB59606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qTNchnzA;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PkUon/uS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WujIgG3y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tASZiyphVEKz9PrQYiK8In9ZhrbPJzWdAZdxaj1zEHg=; b=qTNchnzASmeLa4c/Jg3xvN3qWf
	upAeHtnJeTPdB08AWANfP7OJVU8XzEmQN3UqEpVsx1CKOZ0RO8IlA/fst7lAi1vP6gKzdAzos0pio
	OXl8aab8/k1fmmFOzT8FQvcbcpCKlztUagZC6r0+Pv9UHRAe+UxyffJqUHfpi1vanykzogKhdnBt3
	vOivoEUphhkqmTg7GT8nIV2qLuyTh4wOxBJ5U6twwk/K4mhmDBIr0pBltgFVU4jQbI5ppPQaWz7VP
	xggOCcNcHB1KbKUVAQaAs+T/EYUw+qrCdvF93Wcve4YA8T1KQDVl9Fhy0rd4BRLK5X9KLPjOmRYgT
	VpsIt9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcMc-00000008SeL-0mLi;
	Wed, 18 Nov 2026 09:54:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcMa-00000008Sde-1ppf
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 09:54:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kLkG4082588
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tASZiyphVEKz9PrQYiK8In9ZhrbPJzWdAZd
	xaj1zEHg=; b=PkUon/uSvBhw3UaNBQ88mZDkYnPrCztIX2JtkzRDATe2G5XZsGX
	4EVDKPkTWoOANIgwcJ72n+BaWKKuN0NqajNjaOWHuYfaYPZf1EnPr1/24NhOA8iP
	zCtOBMq5FH2V7TMTwfHxfetihscWR13Xn8zB/SgOvN3HNJeYDLyrozyho5ZXjTdr
	A9C+bp43vjbTrT0huM3dmKcIdA8fOLQT1x4ZkxV/8jhPbaAbFjgdH8AYU/ScG9Et
	5NBAqylWTJD4tLUnEIrikYh5AlYrDyqzdtl9ceyNq2xxPhM1r4C3DcAVlt7swGC1
	nEWeUC8qMIubOJ2X77/jQtIhSa5178i2W3g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jc6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:53:58 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8626dd59f73so859685a34.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 01:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794995638; x=1795600438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tASZiyphVEKz9PrQYiK8In9ZhrbPJzWdAZdxaj1zEHg=;
        b=WujIgG3yqRrzwSIFQEUY9UIY83i9v8+LSTkcyuAAH496DSa6nalntL/UopnLI3NkfP
         7SXwLT0AuuPA4Aq1DLVqkDZzDXT4Bktf9szOck1d6GNKrBwkK9hkUtY5sb54qImp96o4
         Nm1mqjdXYgvqtWTuRpaFyp/7f5gOR0xn1aFJtvqyvBWw1cewjC4+YHYTKarSwDQNvFL5
         usviZQzx/yCU+CyjeF9U4FY8HUKQX+8e8Khgcgf1dJUdjk7eowCiKDtaEZCBt0WwxLbr
         pVwLL+LTSGrdU1A3a0TYmLXTSae+fBaxAoT1mBOmg8uUfc/Xh3dI5jgmvorNbbxulFYE
         U/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995638; x=1795600438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tASZiyphVEKz9PrQYiK8In9ZhrbPJzWdAZdxaj1zEHg=;
        b=C9/CEmfy2TGI3sGQRh1F557PXeSQdHJWABihim1pZHq0QiH+T0QwcJJp4wMVawbCyd
         whzRsoQknoNyFWv/wri/T2/Ougmri7qo6JKcbtyWwI98EHTIQ862uD4WUd6FvvoxHcyC
         Apxzcy1mdWzzIZOSSPBOKSnCGgdCuAi25+1ItWUDAarY541VI3B1ZQjwoco0mR3JFJZ2
         4q3PqyOzWc7W4w7aWBffVTotRGWhMtlMWyQiH48JyYJcUuTTW1sJh3NaMgy4HcYDEjJC
         38kXEgM6Y56atyehUQVmKCfrjftxGrgixJcrx8IcQXw/BxmNzHUwi5h8IyjWNxDU8Cc6
         e+yQ==
X-Gm-Message-State: APuU4Z95nygTtQzMJ16/ri7yTjlFpG1EVNUnLLdLW6FstzMDcukqHGAX
	f3TEZD6zvp14hz2U9GVffQho/I9DOsY5CoGyXPsP7D12e+gXrxUm7gRarm6V7GNWN8FAWytjwpl
	SQnSzrfsfmzAiFbr7fiPXYEuFckf2oJf99+QTs7wPRwX3e4DHtRQ9xAzbQp7w9Ls6sCYtv4mk
X-Gm-Gg: AYBFou2oHK7XVx34ztZfmblm7HC2hyht+GKSddAdkQJAMzNlPrsEXF98mqY8N6PCBnj
	xvjYHSDqpp36BKzCVyQ6sMYh9Us6GS3ffu1Xif8GrxKvILIIEqmAodNmIWoxmQEwr1AMXjQ5vMz
	fh9dqzscyYmrJNqj60cMOzAQ8nwnbIi+uXEVsyNnB1ZGBC7dUq2x3OKxmaGXQ069ikkpqr8T4Gh
	MKcMD3YyOqxdllL6FNd4fjNUR1jpHjE+iEeliNOSeXr/wJZYMqVxKtYlZfAJkOuansGfyBLfbKb
	o74Giq7ny92XwuCTaeqoeOLAS0u98UfAKjPYSMT9+QL6EpkOP46sNHqwiEfBRsTgfVaqTH35L3j
	b6Hg4hYln4nHL2w7EHuXPCzy9jd5VC3JtCbDyRcVYCveTud0FGvq3uGk8EESthSbTRvaLey957D
	dGVoLood3C0U/jotoKZU4/jfiSEmk=
X-Received: by 2002:a05:6820:a74a:20b0:715:2787:e1e3 with SMTP id 006d021491bc7-71b1843fdcdmr1090810eaf.14.1794995637931;
        Wed, 18 Nov 2026 01:53:57 -0800 (PST)
X-Received: by 2002:a05:6820:a74a:20b0:715:2787:e1e3 with SMTP id 006d021491bc7-71b1843fdcdmr1090807eaf.14.1794995637525;
        Wed, 18 Nov 2026 01:53:57 -0800 (PST)
Received: from hu-yintang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm1558206eaf.2.2026.11.18.01.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:53:57 -0800 (PST)
From: Yingying Tang <yingying.tang@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: yintang@qti.qualcomm.com, yingying.tang@oss.qualcomm.com
Subject: [PATCH] .mailmap: add entries for Yingying Tang
Date: Wed, 18 Nov 2026 01:53:53 -0800
Message-ID: <20261118095353.3064776-1-yingying.tang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: umkK6pdud3KK6fIwzSFUb5pVdQJ3q5hx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfXy6U1musPmk3D
 bS7WV/+Aw9Ajl55j3Z3VrQKLUTiYqQMukT6cUZI0qcm737hhtITwSEocYPm1dF8HM7RZTt918LD
 iFicIxC3ehu+vovpOm5eFqUsW7gaiXs=
X-Proofpoint-ORIG-GUID: umkK6pdud3KK6fIwzSFUb5pVdQJ3q5hx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX7gLcU1REtLeT
 V576s0Qo7bi7wdf7c02htVBREbof4oUe+Bumw9jGuolSMNW/qtUzvDrSyZGulEW8Uh1m143INff
 jQRnfYPwmr26m0V9cgeu/28qLBcS3JzPtf8ITX0dDoFMpMrvIjEOCv7xuR9Wx0ha+qzT+WTfMs9
 dNI3Zkb00fSDXLu7aC8fmj0LWkG5cuDQM3v5mgGWZJyLrvt+TYtYJtLAcNCRSaFe1qMZxahtlq1
 BT6vvpjzom178S66Ry0BJ+t2Td3cT16DCHtGkkRYq2LMCPD32hLt+zyk8tawy9I9tX8il2NZ+4d
 mw7YEocSgE49/beAtTX5ClHIaK6C7tgDOg5bJQd5rgg/Wce3J59RxORWc3llZs6ZFgFcDlM3jLv
 /ah9IzeiDpugxQT2MEu6v/0Spe2y73GjSUBCzMlSkVec0ac3TIopbZu2WRutPJd5kg2wig8wYxF
 6G8/DeQiw8g2KUPwEDA==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd75b6 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=s8YR1HE3AAAA:8 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=7mOBRU54AAAA:8 a=BY5PBP3jAAAA:8 a=1XWaLZrsAAAA:8
 a=Y5qkCF5xKvcWswxp5qUA:9 a=Z1Yy7GAxqfX1iEi80vsk:22 a=jGH_LyMDp9YhSvY-UuyI:22
 a=TjNXssC_j7lpFel5tvFf:22 a=wa9RWnbW_A1YIeRBVszw:22 a=gQW0MTutLl7eKD3OLfcZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_015400_596282_0EB896FE 
X-CRM114-Status: UNSURE (   9.08  )
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

Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 02143d286442..f92703d542b9 100644
--- a/.mailmap
+++ b/.mailmap
@@ -1008,6 +1008,7 @@ Xu Xin <xu.xin@linux.dev> xu xin <cgel.zte@gmail.com>
 Yakir Yang <kuankuan.y@gmail.com> <ykk@rock-chips.com>
 Yanteng Si <si.yanteng@linux.dev> <siyanteng@loongson.cn>
 Ying Huang <huang.ying.caritas@gmail.com> <ying.huang@intel.com>
+Yingying Tang <yingying.tang@oss.qualcomm.com> <quic_yintang@quicinc.com>
 Yixun Lan <dlan@kernel.org> <dlan@gentoo.org>
 Yixun Lan <dlan@kernel.org> <yixun.lan@amlogic.com>
 Yosry Ahmed <yosry@kernel.org> <yosryahmed@google.com>
-- 
2.43.0


