Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59051606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 03:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EnJoR2bF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LdVBTR/U;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtZGWusp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sDKxZHT0gd6aHn+LsQQyX3rjLB1t8x74M7iYIvC1QXg=; b=EnJoR2bFXCWbTPQNdii6idmqQ0
	Fd/nGoNSSbUDFF5/kpPGqpZxMRVhMKDRWw6ZA/Tnw4KtdPure+rtk3KzM30bgh/47MdSPO4ONmy45
	uLPwxxhuvhe1phobMHwhIy56XINya2LlP9v12irqP+7eIL8VdbglvKc+9ogO3enbidmKcWW1GLapH
	XXAp7Y7i8/LllxkH6jfRtyey7hUbzGQpbj/+cIdjp6mERBR5e406LndLEnjBWC7eVx7jokYdXxRBy
	qx9/a5lOompH6OHbnByAvQFV8jbQgpSSkGT9vV9d6anO14qrU4L1r+6GVxTtZie0nmUjMCEii/byx
	FVdsYnzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTW05-00000007abD-2Eru;
	Wed, 18 Nov 2026 03:06:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTW01-00000007aaa-1gyv
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 03:06:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vvkg4059968
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 03:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sDKxZHT0gd6aHn+LsQQyX3rjLB1t8x74M7i
	YIvC1QXg=; b=LdVBTR/UrOXFy1IYMQu6FPM+Dqf8voJQiRPIl1dxTIjYFlJZ76U
	WgYuYNhod0qhPy6KzisWrv5PJDi+ySu//NZodha4WznsWujLLJ5pxYmfvekxMrlX
	fs/ZduGbnrRZYjS5u+YYQIAVhKTA3s18+w5BQ2rPTJYdy/Elk9JfOtCODt5osjZm
	iIkGTsB/4h23F4t4CShZBoWGTvlJik0SogyR8AP8hc/NfFohv9e7XlvVjRvZUcv6
	3MVSS0ilbXVMIoOHX79pD0mNE4js7i6W1rGp4lqc+wTxVzeR8+ICu4IyFh9Bl6st
	osTbn/ArQhrgeT6xpAVGXp/10uE5G/zMOQQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcgwqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 03:06:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9210357af78so17445526d6.1
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 19:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794971175; x=1795575975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sDKxZHT0gd6aHn+LsQQyX3rjLB1t8x74M7iYIvC1QXg=;
        b=PtZGWuspR+7cbfExnGpMECSFYwElFo63EMX64JTCrjaCYsshQ9OKffGCKxowZ+FDQX
         IVg1LDY2XmKTo7m8rt7CpDhJVPbHEOf2S3IYUgwf+9TqVhnJUeoxDK/bn+V9OpHzefqL
         9A9nInGMotLZwsmqssPg3zQyvjUF/8PaqLJukbsy5gIG7/r8evfQmObzTnNSoQHS3H0N
         AawlKsVJXwR9XXYCkQMjjxSU/vRw3Aly2DiOEB4NT9Z+Q/jezH892sbRaaTYnjrfoFNy
         13wKtnHYEsKismqvNR5CA76rSJ2tnRp3CCCYiCxP6W/oP3j949VeWj+g0x55ngOcFr7o
         Eytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794971175; x=1795575975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sDKxZHT0gd6aHn+LsQQyX3rjLB1t8x74M7iYIvC1QXg=;
        b=0/eEF8yYPuGwHhmfsMiOQzUYDn5x2nYyHEjBLuFm18KvtzrLSzLroT7cUuUVW6Tc1L
         VYQ9NrAEhcAaaGoUk1zpx69yE7fTRM44ZWCKMVaPihuih/FZQ0Os/l24YnnPslG2mj3s
         4OPnsAa2W5SS008ZxhR9ha3ZBjr/0wT145fVVfQxR0LbYWxceYDn7ayHBGzMtxHMOp03
         kgdtUV9pBVyxt7x6GZkK9ZJ/PLu902BRZAqKb5PNp/s603Cd+gikPMnW1dNNc1FDLWDK
         cVbU8ubigtz02mZjCIKptRp3NsRxgAhhWfviiizSnsEJTtBDnBfll82L6BOUjb9OGXi8
         tecw==
X-Gm-Message-State: APuU4Z8JmPl6+vh/LJ/qxfdWbUOsVVyX+1FjTk4kDelCqlq/wM31vjfy
	BxTEhpEg5Lu+332O7kmfMHGLj3xoc4Ts/1teePfhXMcdKPYPLdik0lY1e4rLQDJC4kuOwegXjIS
	X5OyErwHcud2QW/6z5ySaOPTxA6sHT7OBbbfIWdqH1o7voKLS5545vnpokp0t3bSZXhyAuHUM2x
	4=
X-Gm-Gg: AZFdTZfVD1zzp86NJh9g6Sv3vfx0cxhLjiJjesYJqiRLX2zR+vRckUcz8TvelCPLbx6
	QscxzZTBwdqJRmJZHPyy3+qTc87mj+6OCqKfW7ID2XLmMB1HRBALJ61SILvW+xGdssixVMR4j4+
	R7z4aMzzyrtTaZngH1h46qb0b+MEwMwEEM+dA2P+5Xm+HTm5E8Xj5oLG0icL+l1q49wlv5E62Xg
	HO5J5iJCoZUUOpcB5WSoZXyYY9Y/phKnQbusBb2ftCbC2jSBBs4JurSEdYMz34bb4FYvPcnTO3G
	VqivEDaM4YwEP5OolWRhCNHsDK+R65k0hz1IdYInSgtPBMwazUlJp+wJdojylW1lq67vibZPFJ+
	IvABWI+PYc7sYmjYVAOwQVOIuOGlGTp4+2AugUUbDRu8+E6YaMIjNGKlGDU7uQZYV3HnKcIIKe9
	QofMpBHeUi13QwJDNhkZ385hStshRZHiguli6q
X-Received: by 2002:ad4:5c82:0:b0:920:ec2a:571 with SMTP id 6a1803df08f44-920fd4208d9mr78401086d6.28.1794971175059;
        Tue, 17 Nov 2026 19:06:15 -0800 (PST)
X-Received: by 2002:ad4:5c82:0:b0:920:ec2a:571 with SMTP id 6a1803df08f44-920fd4208d9mr78400896d6.28.1794971174524;
        Tue, 17 Nov 2026 19:06:14 -0800 (PST)
Received: from WENMLIU-LAB01.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d28215sm9977106d6.16.2026.11.17.19.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:06:14 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH] .mailmap: add entries for Wenmeng Liu
Date: Wed, 18 Nov 2026 11:06:01 +0800
Message-Id: <20261118030601.859-1-wenmeng.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd1627 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1XWaLZrsAAAA:8 a=FOH2dFAWAAAA:8 a=SRrdq9N9AAAA:8 a=pGLkceISAAAA:8
 a=6Ujbnq6iAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=6BLRbv8tGI4HsbrbaaQA:9 a=iYH6xdkBrDN1Jqds4HTS:22
 a=-sNzveBoo8RYOSiOai2t:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: NpVA_bn2wttQ-bjuxtLlZq-WgWWgxVf2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX3ZWk6hgrvWlM
 txE4ZGyE/S227eVsGCmqJzpEZZEiy1wI7o/XLbn0kyVV68xb+2EFtMpZ9x9AM8viTcwB5abPZqG
 PZqtzxMwo6jkyP7QaNzwvckP52SyZ6U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX1MTLkhdWta/L
 Z7t2UUMymc5ZPlmzLR7K717IjNI68CoAMnFhZ2G0yW73n2DrY4YQmPvHcPpbxO58f5O7tOEo7ot
 kDA4iOkYDYIjFX4ap8CwobcRIqzEQAPJ8dj7fYomLtpdc+EpT43ERp/bu8JLUBn08FBMNDBuoTy
 3+ln0/OlIkUfGS37e2ne/oks+HfTyJfklM4KXPCsPykdVCU3a5g7Qjq6zMe2r5GwVYBMSzgkIoY
 644h1RTvN3s9B/D27dACBluSR81UMbfy9zRIcVyop0ZUvSpqIoHDM416I/oyk6l83eF612EFMuE
 JxhulkaIIuG0GgoRi6xxYyRFqPWpe9UEcv19VZ24ExxRXDFwD4MpqXquPe+gJYeid4qxAG7J06s
 Ly7gbEe4bI+CHQb9Ev87RxpN/XM5ttX3yxqNM4F/ERadbcjKbnywc8+F9AHXYTr4D2RH6JUEru7
 qZ4UgU7N/jUSxdZfauA==
X-Proofpoint-ORIG-GUID: NpVA_bn2wttQ-bjuxtLlZq-WgWWgxVf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_190617_554969_7288026B 
X-CRM114-Status: UNSURE (   8.74  )
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

Map my previous e-mail address to the current one.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index de477b76d6cc..f1cdb340dabe 100644
--- a/.mailmap
+++ b/.mailmap
@@ -1032,6 +1032,7 @@ Wei Wang <weiwan@google.com> <weibunny@fb.com>
 Weiwen Hu <huweiwen@linux.alibaba.com> <sehuww@mail.scut.edu.cn>
 WeiXiong Liao <gmpy.liaowx@gmail.com> <liaoweixiong@allwinnertech.com>
 Wen Gong <quic_wgong@quicinc.com> <wgong@codeaurora.org>
+Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> <quic_wenmliu@quicinc.com>
 Wesley Cheng <quic_wcheng@quicinc.com> <wcheng@codeaurora.org>
 Will Deacon <will@kernel.org> <will.deacon@arm.com>
 Wolfram Sang <wsa@kernel.org> <w.sang@pengutronix.de>
-- 
2.34.1


