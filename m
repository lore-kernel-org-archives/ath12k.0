Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A75606A32A
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iHC73xG0;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLAu9GbY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TbJWfCSV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=t1N1Dvte1aZfNVvEZHx6L7AIUeNSfzYrFyDZ1pGpfaA=; b=iHC73xG0dvI1P++Whs1/y+XGpR
	PGgfGg4jaime4RInWJSs1uKDAb9OYPKGRJuv8zwEgtW6hTEcwOMqg14McSKcOF5Iawe9KKIilFycs
	LcMVGM0CEVKGpjMglzut/tMO6cRrClwzAmpsasYPRXnbQyDkFH+Tfwl2qvzfybZU8wcY3Uqm6riqM
	72neOTAWGBkXIYqyS6rSvU2Dh48Zvu7Jx8QyPQD1gYriYAhHgxdMcyzahS8v7Xiu3mxRIXWc1fFWc
	xPrCcsG2WiURTlMxeN+OWFebXDbCKsYPT/CfSwdAR6sEJBooIW4T3SbYmvUdsWUz/SSG2k9Bf5lmH
	XB1aFkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTalz-000000086nO-02tW;
	Wed, 18 Nov 2026 08:12:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTals-000000086mZ-0ULL
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:12:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V6fY2106465
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t1N1Dvte1aZfNVvEZHx6L7AIUeNSfzYrFyD
	Z1pGpfaA=; b=TLAu9GbYD8iB1Lv10oXIo5V0IIUtyWawCcXSvFy+w9AWxUvh1V4
	hahtA8ZU/fqdM39DePrxv4hcTBm3+rn51cShL0kJ2U3BJZrTTirarVgv9G8MYdRs
	jftdN/a14kQL9CvBPIgXv294TUyuaVmPllPdR8wKVyqw8AGSGuanXDNoQEaZFnmY
	5WlVLaqO/KbA6UPdUcWxeXXJwqGK8YzA/KKPOi6kTntB0GuOX7bCVfK+DU0UP5Cw
	bOkSKzmvaFgsyFGT0sNHvyl9/L2Ds4iPEXYyF2CHgw+7uG0xK+Su2CF8AH4VVfXR
	ojrQRBsM/5znM2zTT1wEMoXW4NLLQVRaSHw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sx01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:11:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so957512a91.2
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989517; x=1795594317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t1N1Dvte1aZfNVvEZHx6L7AIUeNSfzYrFyDZ1pGpfaA=;
        b=TbJWfCSVa2m/1eeVVNl3jIITQnfA/3EQq+P/MHqOm1mQOmy6/DhP9806pKtWnSTnA2
         bgklUJqlkjJIgXUpYTzujBZcfYPIJ110RZanRB8TydoYAHMBkpdchfCbeVfb5atu9H5b
         xqrJ8Y4DXslQZT0AaoeoDS5TCas3cG6ubDqAd7fWZnOZ5fvhhgAr2o23X3VmAY75/5tx
         HrIisiwQUaJBDYhcaV0CFyBhk0/TMWDJ09IGdziSyg+3hoEG0TByBGqnfbZtk5DDN37J
         mTgRRskhPGfA+x0mTcHzvADcNNx+k89BTsUCiiaGnkZilsPurMdvgYp+NQKapHJmYqOA
         cxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989517; x=1795594317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1N1Dvte1aZfNVvEZHx6L7AIUeNSfzYrFyDZ1pGpfaA=;
        b=A3EFhRMmqCZsvMGGgXzkLnuC9xWPk5DKC+Te129LYXmGJsxC5bhB5EuZZG9JC2GfQO
         ni+Te/YFSnNtXv4Flbp1SbPIgNbuXbcFL4WZLO9eoqsDAa/zkpuEXyooE8zkZWx2uZzh
         Ct9QE0poh+9DMChHLjgFcDjIAPXL1/Ovk0Qjz4pbT1IA1BXFT5NyUIOy7Dv750HgUGjQ
         skmnMqCKnjWwChER/IgVPG0+7Ba4iupY82cpI6hWZgwAWdqGCLJ5Sy9pPLsJydMbkspN
         4DlKC8BbyU3/Gy+qm2DiQX7abcMSl8L7h7WkwMyUc/B2ma+6cRtdZOv7hKnzg1gLVb1h
         BuJg==
X-Gm-Message-State: APuU4Z8CargyVzAd28Adm0iAmIUZlNVg9qpKaM5jRE/wmIgihpcnbpSC
	mNzjdh2Tr5wRmq7c1OCp5k1j65DT71Oorame7Vgx2RVgpce86c+QfGt0LfekkWaO7+oK0ueDmdw
	FxAFa5b+iTY+RgklVi1+h0OvVnWX8jmjd7zctEMe/r8/j5YNB23WIF4noIEyh5wQi71wt9/DYyL
	0=
X-Gm-Gg: AZFdTZcIIAs7JmZTMrTmBfkwxaKE9VAGtxfx3iqw+Mo9uRQUgLgXTYdvpH7P6fbNuni
	mnPbYp17/vo/xhh19bWc2MJ1kEJmQng2V9NsR4C3LBxUpidQICigYTo/I5Igp+w9XkJKzpakC6M
	h26qr7/ma+y/EigZcyRqeUjQwYb+JfCBm8t9zNFDHgP5a4CnJaesO4KT0gJg3eJGtTTNglBwK3i
	HYGhFKqkL0YR1QWk/TePiprRbP5BK05aOoHnznsSZGKtpd+1meXLdWO7XvzarbtGE6LDMx8UwsB
	B9CUJVEngOzQcznf3t+dYytpIybHkmtBGtLl77G6bBJPllmM+MIxSWLEs02qgmBN+Vo9YoH5vVR
	L4nidQlOGJEyLjmP1Uc8/qbPxX02yfJlAyprlKCbOREP0zDQeqHvAuKO/D6PbvVBAp//leWQhUF
	K5
X-Received: by 2002:a17:90b:17ca:b0:3ac:7556:8ee6 with SMTP id 98e67ed59e1d1-3b3d074d74amr1874303a91.16.1794989517506;
        Wed, 18 Nov 2026 00:11:57 -0800 (PST)
X-Received: by 2002:a17:90b:17ca:b0:3ac:7556:8ee6 with SMTP id 98e67ed59e1d1-3b3d074d74amr1874285a91.16.1794989517027;
        Wed, 18 Nov 2026 00:11:57 -0800 (PST)
Received: from sdciot-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5693f1fsm1065673a91.1.2026.11.18.00.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:11:56 -0800 (PST)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: wei.zhang@oss.qualcomm.com
Subject: [PATCH] .mailmap: add entry for Wei Zhang
Date: Wed, 18 Nov 2026 16:11:30 +0800
Message-ID: <20261118081130.1319688-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HX4khBmNCXkD9jRpIteHjyLo334eKc6U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX+gwD6ni3tYAP
 /nQPce2DjZZRanZMPmp68OjXh3tgZsw+oxspo7hjmRklUKysnGR/k5yC1wXbsfNSmncrgYK/Y3I
 MVOr6qmo4LC44u1jL1ZslsIwO5PboBA=
X-Proofpoint-GUID: HX4khBmNCXkD9jRpIteHjyLo334eKc6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXxcf/+mE8qfgf
 oAbNEr6O+38xKAN4SWGKbs4S6jN+RhZbAt/NgkwXCuYGzerNcJsXXrt182waYa6RBaryJUt/aCM
 c5YtUeMstfxWGJg5POhJp+cAijr/rXWTXOPiawQMfRw8DMB6ebcNzO6d8ZRhlXvn9EZ/ESGURnd
 0ZpqXLrZ4Ls0OxTv8nHYKpgeDln2CBu4urto8rWyHEnkzgS/HgYs99pDXAaDin2AuHB/qd1qjP+
 dFxtKAOQ6+OmVYXKH1kUgBiiKj3ef8Ux/KsbeGHT0iQV2+cP3dp0hi2wADoAtu1kWqMoxxGNuDb
 PDZFKGep7KHbbdAHCr7iy4GXS8LtCxdrG+rlhAGjFCh2uPLPQ6t6CIGH9tt0kdqTaTE4Y8bv9P6
 tGeHF0Q2aMttnb7g2UFYssAIkhDz2zLJxrXsmfMXBENBgRPSvIylo/UL0qubBapiC157AVPEIK3
 sBnWBlsimuTAXNj4r5A==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd5dce cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=NpZnplJrAAAA:8 a=1XWaLZrsAAAA:8 a=FOH2dFAWAAAA:8
 a=COk6AnOGAAAA:8 a=SRrdq9N9AAAA:8 a=pGLkceISAAAA:8 a=6Ujbnq6iAAAA:8
 a=LpQP-O61AAAA:8 a=znq3E3h1V30wI4N95B0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=uJwenkVCW351QmmeVxDH:22 a=TjNXssC_j7lpFel5tvFf:22 a=-sNzveBoo8RYOSiOai2t:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_001200_292586_52868C3D 
X-CRM114-Status: UNSURE (   9.04  )
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

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 847928a2a715..d1e9f3624fa4 100644
--- a/.mailmap
+++ b/.mailmap
@@ -1014,6 +1014,7 @@ Vlastimil Babka <vbabka@kernel.org> <vbabka@suse.cz>
 WangYuli <wangyuli@aosc.io> <wangyl5933@chinaunicom.cn>
 WangYuli <wangyuli@aosc.io> <wangyuli@deepin.org>
 Wei Wang <weiwan@google.com> <weibunny@fb.com>
+Wei Zhang <wei.zhang@oss.qualcomm.com> <quic_stonez@quicinc.com>
 Weiwen Hu <huweiwen@linux.alibaba.com> <sehuww@mail.scut.edu.cn>
 WeiXiong Liao <gmpy.liaowx@gmail.com> <liaoweixiong@allwinnertech.com>
 Wen Gong <quic_wgong@quicinc.com> <wgong@codeaurora.org>

base-commit: ee7edfb99ee26581633fabb0662382734ea3cdbd
-- 
2.43.0


