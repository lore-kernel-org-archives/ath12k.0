Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3DE606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 07:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hZ0tgRwe;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nCDYWxVs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DlWr84w8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9Ys7ckJ0NiXYC8rabs2qOxb21BW3bN6Bd8NpzgbWrXs=; b=hZ0tgRweDz870y+bk1Xx09R6bg
	//uepbgSdDAvTsHo67DfP+M47FTx1wGM885j5Qh00tM9uL/qxJJevmK8kCs4Y6eS4Yn9NcIiBPFnj
	YOYapm+4HDlpjpKG1r1psiNxs1oh0gVx5+QG9fA1zO5xK+nLJOLBDT6lZAiiooMpxTuVnxPQ7xAl0
	nPg0WPBnM8C/bzYJiItE4wTFTifEZv6Rk4PEl07ihqqDRRaPJTG41tYPIMSyA1XfoLVhQPt275HAj
	CX/5SvMGO+pmLYxopMpyCwV5SyKIGd042a24xngj17E2WBcUaVvR+8Hojy02JHp+dhMsT5TtTepqP
	Eg4Aq31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaFb-000000082Xf-01LI;
	Wed, 18 Nov 2026 07:38:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaFY-000000082Ub-0j4i
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 07:38:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uoq72382984
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 07:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9Ys7ckJ0NiXYC8rabs2qOxb21BW3bN6Bd8N
	pzgbWrXs=; b=nCDYWxVs9Ajq7t2exrCqWkXh1k260JMWiKzp4Nqc4xvjgs0Jkx5
	iMc5yZ1a65ciY8vxX3CCp78NboSkHFTPSFVbnb3ZT0c9PJv4etpFP0ft7qLMU0Wo
	7JYex6HUd24h7yMXz2NqI5QuFxG36FpWtRyavkbLL/9G6Nr42iEffn+dMK4np3IY
	nPD9JLY1viS7VwPu5C+QEz5VmWjFazbXN46zcxg6uiVIjUq6mk//gSL+QVy8pPoe
	X/8IuMZecpM8heHJ+awKAZiaOx3bEvRdKsH1GXg79NZExFSlFjGBcnBhu6srCD+X
	adJ9PYCFWUGv3SeGKCmaHbbGOemyx3pW7jg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasv2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 07:38:35 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4eb0b989f0eso805277b6e.0
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 23:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987514; x=1795592314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Ys7ckJ0NiXYC8rabs2qOxb21BW3bN6Bd8NpzgbWrXs=;
        b=DlWr84w8sXv3/xpBjKch7wRsms3/oYcnE3BfQVCCT9xX9kAWHKvpaqpnjCdLV0p5zp
         uJjzlZNUwn17cARJl34V0Tv6L5krRwgsP3+/e9EMecnbdjqy5hrKpfeGdMTVBPOUvzZI
         qlAF4RE7FmFkMK8s5Eh58we8A3e/8KSzdrluHfMU86JmF0jFIOMTu2uAt+OFbjCixEJX
         H+YZv/KwrWxxJZUw5OW7RtpngHA7+FQhH8paOEZdP/Iedg6D76ay/f0huTlYfAfUpAJw
         6P5CnkpW+p7xSeldMcBalX1j/Pz8KaFjJoUxsmYAcDXY72sK1+Fneg9EG1V6hdVhj0rw
         CdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987514; x=1795592314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Ys7ckJ0NiXYC8rabs2qOxb21BW3bN6Bd8NpzgbWrXs=;
        b=1fEUBpOQ4fKLITSFO19Nxi2mbPAFxYkPYB1mbEE5qvp1VK6tV3+jgIYUFIl0IUqoUb
         PAaalaIAKrxfq7jqHDxezJTE9Zqqs2sQz93mN9ds6xS7Ktwn5sUjc7ln2yMiCLxYo9J5
         L067yOXm8Vt1vx/JHZ3qAPhXpydz4u8tCej8NLy13ykida8eQbPqThB/TlLRosuev72c
         YmVISW2aaHDHxromrVVgvxNkucgmDk58SkWDusBxdinitqyUB/Ir74GYcfqtlUjTH4sj
         j76xMoG3gG3v1toRCHbLAjhXfjMeXuOjsNVs6PrIbYCe3GOSHjenjGlf96BYh4Xy8BZS
         DXzw==
X-Forwarded-Encrypted: i=1; AL+hErGvR1Z+MfO4coRikam+1HejUpp3xQK9ER7dbvkwNCdja9z5eL0RJwHmaynOWdoV3ogXfRYkycc=@lists.infradead.org
X-Gm-Message-State: APuU4Z+CgGL98ZqYFrCtM8flwIqDW1Xbxtah3fFrx9qKUI7Qx1LE3VS3
	gUoGGAZYKqi4KgRK3fAXfex4CkxAziUB1c0PYH+xDM0kKer7t0nmrSmsCerLWK0peznyZMJe3dg
	i26AgBhTbNF09JSmIG4qqC2Ibhx3CFOAqWVd8J1bYk/WXZ9AKDkrGMdzONOndVUVg
X-Gm-Gg: AYBFou0JtF29tzQACOpHqe1z5neKtLixe1sBC7TzgiTwzXB+mSqNXvrzCV8iAErfuTQ
	LDl4r+OPDv/hUgQeu8/60Kun9WnXRqut++OQ3ZsQndp+1HXChmUUx8QQI+6itlD2UMfasRD1HOw
	88SqPoaj0BsRpHzC2QHxrvxO8iwqp+wDeVydqMnM8UhEoyKoWo64AnnJ8RQfzx7/fBrNdm21iSS
	el8LvzfD3Ary8Xp6xPU96O3P9CcVHtIXnIYhOgfIsJ6HOGhjZ41zm0SsWzckAXV7DZXns3U31S0
	yjM9jv2hIT+X0JCSaAxJsDDTlMXdc/DoIdeMPFloii62HLa397as0hXuujtOfSwaod8lNbJAUad
	CcuzdKDPrakXJZC2dQq5u3FicwFidaRyqpRrVv5RkaRBbHytea7l+5BMnOeWECwFkw68V0tM2Ul
	t2rq+SAON5X2hh7IXYkQ==
X-Received: by 2002:a05:6808:c2fc:b0:571:a186:d69c with SMTP id 5614622812f47-5773b4330a4mr1554002b6e.3.1794987514568;
        Tue, 17 Nov 2026 23:38:34 -0800 (PST)
X-Received: by 2002:a05:6808:c2fc:b0:571:a186:d69c with SMTP id 5614622812f47-5773b4330a4mr1553994b6e.3.1794987514103;
        Tue, 17 Nov 2026 23:38:34 -0800 (PST)
Received: from hu-yuzha-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777ad9b78csm1006995b6e.13.2026.11.17.23.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:38:33 -0800 (PST)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com, ath12k@lists.infradead.org
Subject: [PATCH] .mailmap: add entry for Yu Zhang(Yuriy)
Date: Tue, 17 Nov 2026 23:38:32 -0800
Message-Id: <20261118073832.1261471-1-yu.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd55fb cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=7mOBRU54AAAA:8 a=BY5PBP3jAAAA:8 a=1XWaLZrsAAAA:8
 a=COk6AnOGAAAA:8 a=n9Sqmae0AAAA:8 a=pGLkceISAAAA:8 a=yC-0_ovQAAAA:8
 a=Q-fNiiVtAAAA:8 a=eh1Yez-EAAAA:8 a=OVitEytcRwG1oHMu9lAA:9
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=wa9RWnbW_A1YIeRBVszw:22 a=gQW0MTutLl7eKD3OLfcZ:22
 a=TjNXssC_j7lpFel5tvFf:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: CfZIkcrd1qa8igZMphU88usSDGoMrsGY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyOSBTYWx0ZWRfX7QjnasjehEFb
 ibSf8uLao5eKgSbo4VuMLIGeb2k0giKdQrCsxBnG9pmWjD0Qejhh1Esvihin8/x1d7M+sK+NHwJ
 mfWtLvl0xIHtm0rbeeDdUFXQktO9FvLgsEYGluxUJCEArkBVarLc0vS0pqsfzbBwKMNqNw+4Ad3
 /60QUYJp9XxU/IjlOS684M42oaKCj6YCCCcLexAtctFk4CWi85jf2k1uaHSctp3UhPtCPbbgt6f
 l9ua3KFHg7O/nG1UNKWZVZe/7qvwvfYJ/rgUcfi1CrsH6Utf4E3XTNgcTbOPz7mMF2spB0RjRzB
 oZW3bbw8gh0yEfAajq1SiqusZq048K1FL5E4+s60WeIzv1YVwvASSsGZL4aO5CzZmC4vVvZiBvt
 OhgJv5Z+V06tD1okYAgWGsmDAn/uamcrRpgMbtjhZ/8SM5VUsyqrfK0ADTO3z1QLbZaur77OaA1
 UO/4cOoCyBofAlP1x8w==
X-Proofpoint-ORIG-GUID: CfZIkcrd1qa8igZMphU88usSDGoMrsGY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyOSBTYWx0ZWRfXx95HBEQPdMHW
 nGAiunagkJH8CBkc4FI/BnDtbJkN/OPsa+2OvDQXhvgOPLwBSqxe2byggmTyf8LBWJ2UrIm3c48
 ChSLYNih80X8BgXEDhE7RtEJcTnMSlk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_233836_229849_A7C40688 
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

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index d73ec73e5ba9..d5979b95b530 100644
--- a/.mailmap
+++ b/.mailmap
@@ -1008,6 +1008,7 @@ Yixun Lan <dlan@kernel.org> <dlan@gentoo.org>
 Yixun Lan <dlan@kernel.org> <yixun.lan@amlogic.com>
 Yosry Ahmed <yosry@kernel.org> <yosryahmed@google.com>
 Yosry Ahmed <yosry@kernel.org> <yosry.ahmed@linux.dev>
+Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com> <quic_yuzha@quicinc.com>
 Yu-Chun Lin <eleanor.lin@realtek.com> <eleanor15x@gmail.com>
 Yusuke Goda <goda.yusuke@renesas.com>
 Zack Rusin <zack.rusin@broadcom.com> <zackr@vmware.com>
-- 
2.34.1


