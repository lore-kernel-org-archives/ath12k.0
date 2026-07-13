Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A557C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIMnaU+Ol4JTO7loHeoW9VtHnJZj6Ry65twm8XWtzq0=; b=TgFaQE00iGHzUn7AqLbLyuf3sC
	dqy8/jYOTyiRsS8/rOpwqG2TAMyfW73U42TIuALaZIV7xOPVmpqI4jPzjSNyA2ILxFFl+uTOnIR7e
	5+ehXLI9+vCUIUYnA+IiXL3g0cwisU1g7Fetr0ysu92+4Zpv/ucCujVXe8AXf0LazPhKoGCbjNAV6
	MWDFM4wLGa/tocvGIeD1FVZxrYMyb+CxM6XfFYto6wr8AvVeb39VGzp+PnasmhZe+/EyRYNFbfWeK
	n7hGiVe4Y874j19jLDWovFQd2ThMVJIDgaiwygqVIUD9dlbonF2cv1LGd4cXvqwwim+Sn+sLSsAcl
	ug32gikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHI4-00000009XsO-3quO;
	Mon, 13 Jul 2026 14:05:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHI2-00000009XrM-2DZo
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 14:05:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE3dK1561386
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 14:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oIMnaU+Ol4JTO7loHeoW9VtHnJZj6Ry65twm8XWtzq0=; b=P7M6HtgBYTYxPNHT
	U+DkmLTCfePqyGh+epWQQI3nObwSiw2zXVX5YKJTwydBZI70+w/NYAbGLN2alwc4
	VqoCPWTgyA39KDBGB7t2NW5tWR+bHalZ0pLBiidHkbzyHpy5RCRs0VXk5fDSxugL
	lSwhLoNnDAcBxjaNqMno4xfDHo69AWtHKFc7bgx/NOQLS7lTu4AW9mZg+RcrtS7t
	P5GZcpuCv6wjGJGbFdkloErz6KK+92R7O7loQwUJy3NyM+UGSSfz98r28O9nlapl
	ImnYSfDfcMjjXOG9tNRypuCG1yRo48AgSIZZQaB2vDQ6JOkWk6cATJRn2pYZwRih
	H2pwrQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3auys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 14:05:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e095fd889so1276151a91.2
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783951545; x=1784556345; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIMnaU+Ol4JTO7loHeoW9VtHnJZj6Ry65twm8XWtzq0=;
        b=gLoq9JjfWzLQ5GHWK4n/XUeHcZrM3vjsgFT1mHx82pYEzBGn8qfpDdUXsQHDeMTMXk
         Myx5W9mETOnEh6EVDqBVOD1KOvIoTjt2AfA/QdNcDfM8uDYEzLQO2wiUWtszrHBvyZdV
         9gUUuSalCQodgHRmxpHZeIItpffi4ebiN5G0dj1Z64Our4zbU/jXZce6tsBHJBRG341X
         jGa/sDjH6NOQIKfIzD2dGZ+vNOvQjfcR3q1dKQWSz44z0+97zlasZ+kky2YkkHsJinEI
         IJiy7wTA6JdzLvcQgMc8qVqq5eCo31il3bEXm08ia82Ru4LEtzXeUmm92mZlxgBtLR/v
         EOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951545; x=1784556345;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIMnaU+Ol4JTO7loHeoW9VtHnJZj6Ry65twm8XWtzq0=;
        b=XS3K5lMDZIE+SJutLGGLtnVuJ19+Oh/skS4nE9AqomMZZ/BxxHfYaKbyz8PDpqaJl5
         Lq37tUbvdlg8kJs8Ju1k/yWRk0gmyYyDkPzkwCzyerYLeQdfVfZE3teH3rjB0yDHO7VS
         x010gvrOJdj5AnJ22C7pJiS/s/2VTkPQsJfYxTMF60JWmYQ0uPoc2NPoGkTvfbpTRz2v
         v0ts7XzolxSj/3WIPS6N9itTPFUvj2kLC6OXxlILmwYuM+Tjc5ZYVTjL5y18CwzKVxSL
         jRvPwOadsJpZSYL2YYhuVIjEtbzZENnAO5kd3E10D+NaLSK/GvsAWe2Vbi7aIsxtWPYQ
         Nb1A==
X-Gm-Message-State: AOJu0Yxn/AL9tAINYw8EfxfsRFgEg3BiCWufqb3f9u9TP3gIld/SD3Cs
	NFxWCNp5MYoqYmmCg9V/HhIXSu8Gg7dnnMAjo8E0tP3t7oS8/a5yMZLMZU8eOJRI9cPcsSW4CIo
	PrMkKM63KcwVkG7U+quUMWSfupqo5y47L57/A9AFpbw9azetsoxK+zFxSYkBlcueJ
X-Gm-Gg: AfdE7cl1ZAX/lRxkqq3GjVAl2L7dDQVfXmyGpQ2IU8u2WwGhPFV/R+qr0d5nZwk4xQK
	2MIX92clAhVNL5IA9iXz10TbajPaXuJcSc1bqyJ3+CPw7R+t8dQpl63mJ6/F5ajn40K495uizc+
	egpy8NTwemFzJedQcws5UU/3ImdPt4WEpHxevN92JuEBRLKq8cYO3x3TlxVTnrWgDKsrMV/GsBJ
	syHeamsMHvG7vnb1vnLFArwu8RoYVoEgPgqbPruT2esVDsq2yOaUxdrbgv0R/0X8WcheyZQlJLb
	r1MyMK46BRZOF24z6gQ+LSq7ceIfAWY6iajaiQVAfEfl5sB7H9TBVXUGDzaHUYPZVAx6esgvffW
	UyC+w+iUhAEwkbp1PSF8yeUGHXdLyCNQwd3I47nY+iLTCLjDyVVcZIc0JtCUvq7cm4g==
X-Received: by 2002:a17:90b:4c4e:b0:38d:84ec:b03e with SMTP id 98e67ed59e1d1-38dc73bdd34mr8130305a91.6.1783951544610;
        Mon, 13 Jul 2026 07:05:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:38d:84ec:b03e with SMTP id 98e67ed59e1d1-38dc73bdd34mr8130283a91.6.1783951544173;
        Mon, 13 Jul 2026 07:05:44 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm77071424eec.0.2026.07.13.07.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:05:43 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Yingying Tang <yingying.tang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
In-Reply-To: <20260610053315.2249912-1-yingying.tang@oss.qualcomm.com>
References: <20260610053315.2249912-1-yingying.tang@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix low MLO RX throughput on
 WCN7850
Message-Id: <178395154296.877545.10977957684434066433.b4-ty@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 07:05:42 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE0NiBTYWx0ZWRfX1gXlmilFAwLk
 GQcmCaj925XXrTjJZ4OXvlkD6N+2FGU3sakVcEKu3IF9ygYqy3lSgBvlc/TCOLZbcz3quHnBEAo
 T8Mem/jr19QXRbykvM/gqeqwgJU8Yrq/hSVwleiI7adgLv96xv171yFJ1dHd7ZzA1IhP9bN8YUZ
 v11PW+wd8JUDT0fvd/Vm+15FeXVpZsEh2SvWTTGCkYIKRfB60rGo+YleQjP9GyO71DL4Wki6rrC
 qVzQv+Kttf6N55DEsqaRe8S4FH+UCnvTQgkjndnE2GwSJ7W8iX/vgK8HQKwZ8g9f0g4dKyJDIbE
 zyf/spK4tSksfSKUF6a2AbzONX1vRS3HusXLUkQZzNci/rCY4AIIqDXsxzQ9QtTXQh2O1F3bWmt
 C+Hpqpvzy7NcARO5g2JzR6dZaTDvFmO3RGpA3fj6SCwRZt1L41b+xceDMAt1jngHjVVStBzkQSL
 f/6T9zLnaVR9IM6PCow==
X-Proofpoint-ORIG-GUID: i3NtbvcFtx-YXembMKW-XCUPkpJuysqx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE0NiBTYWx0ZWRfX9j0B9TpIWYIl
 Sq7zPliKv2UozhG3Cz9+Uyaff7euE1eWhAqeMIwezRzS83IoZnOSGMfaRASdiwRVeIiDAz8mytb
 yG64DBK5IjTSRQWXf0T6O/3vPo5SJiQ=
X-Proofpoint-GUID: i3NtbvcFtx-YXembMKW-XCUPkpJuysqx
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54f0ba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=UZfcueCsd8n1aYJIn88A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_070546_579216_F12DE258 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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


On Tue, 09 Jun 2026 22:33:15 -0700, Yingying Tang wrote:
> Commit [1] introduced a regression causing severely degraded MLO RX
> throughput on WCN7850.
> 
> On WCN7850, there is only a single ar instance, but MLO uses two
> link IDs. ath12k_dp_peer->hw_links[] is indexed using ar->hw_link_id,
> which causes both MLO link IDs to be stored at the same index.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix low MLO RX throughput on WCN7850
      commit: a2fe9dc70f3b8d5716fbcfed5fbfb9cf3948d402

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


