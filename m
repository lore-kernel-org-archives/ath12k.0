Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58144C43602
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tW4zQR+2Ehtjc5CScWNshZs8opJhgZensbpccJj6Wl8=; b=zeXXCQ8SmtqWxoWhIED/eXDGUo
	hFKLQUvboCjPpTQDNb932aCyZxG9dJgi5rwRAwmxEUJZLKCzskFDahOBuRDuX/29pSyyoV6NS6fWb
	2B816dt/tTtrDsuCELbtSlkTbHn1ivg+0g3v9ZwpvdKX3JeWTBAdTI0QgopVFF5I8jNo/a0nK00Lv
	oTFmxmHmHiM2PDZE5nu87Vq9NTdqigKRHkXUuGlywwjDtkVcLa4C8l6+WPrKq07IxxYzM1jCxrqrn
	KCgNaUZmdk5YzakOm8KcbJHjCux+Njxx1Xlvve4niC2w9OmnLUBzvVNfPvPklVOLjswHReWoa7MMZ
	PEL20+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyd-00000000Eqz-0Q1M;
	Tue, 30 Jun 2026 21:26:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyP-00000000Ekf-189R
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDkJx2942727
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tW4zQR+2Ehtjc5CScWNshZs8opJhgZensbpccJj6Wl8=; b=YpqEcNa90YsfmZVj
	GhX8n2icSIBti5b0v1ETQKTIIIX6zTpmSA+VQGzR6+k8IxR0ntHNmifMOz+OEcjf
	9BLwrBKmrbXA49IcAXh+9JwBdReXGJtlzw+virVPkSQlXIpbwdbisGpbONA/HN/1
	w31MQEvO5gfRjDNn4f03igJYo0FMnDX5wwZbmG+vuE0dIxfDQySxA2DN+HitWmMb
	TzYlDEXVQnm8Q7Y7j0i8nyHXfVpr6nSckT2w0YYV0KYvn1QFjyjSN++QK50/hfuK
	sdfh0Utxv0fes66HGqItnrvuA0Ck5ylOqPA4D7/x/zAQVmQjh7CYsd19n3J6pfnC
	vQpA3g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j99h0fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30eefcf4a1fso1009597eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854788; x=1783459588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tW4zQR+2Ehtjc5CScWNshZs8opJhgZensbpccJj6Wl8=;
        b=Hu1yYfaj3ST8JbsIK41F9pAaRCHIRdYCJFyKurwnupbQ42KYbqSF6Vg00FGwCUOGMw
         5Rzh3X57Am6U1++4Locd3YSI4ojwMzcn/SfBYayQ0t260s2fKcqASqaAgvkLAhb+46tj
         zGSUB7d79mGqRbXJPMufqz2eIJAOjkFxQ2p0T+3WddQMGvP73tbNSUPCL/yLL7QUr2Vp
         dU7VzD4d5ycY9NDQgT/wzu3u5Dsg2eJ4hvvCT5RX9ELJ4tu9CtljpnwxJEZLacXL7zZN
         6P+rSXUu1ezV7jCEbfoXxkOAr+A9JZWbGtiuFu6boeFCT9yBAYfAN1lNTQNAqzzPlGJa
         QHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854788; x=1783459588;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tW4zQR+2Ehtjc5CScWNshZs8opJhgZensbpccJj6Wl8=;
        b=VQUP4CCC3VLyshuQKpgEqrdOlexmA19fkibaUGiIFpGFksyq+tVP1Xastp/dL+qS7t
         iLVpTkE2tJOQuFqZiqIhVhQzRx0hh3CmINYzkb0UFJ7Jk1zmybEFe1CGRvX/tunOqcRg
         2i47PknjI2lUBLOCglmJNvwz0cSptBGwgS2Fd19uxCp+4bI5d7oBfWhhl/rjpQqf4o01
         goMj/uD+hx4Hc7aAUPgtp6cMLBOdgRd+8dAEUeHyjobe7UuGWzaRMy7vLQOmRtxPEuxL
         dfW0RIv7kJsyN5y12xarXYKNYSMhelhftQ7gdKWw/lugzbkHeJgFoeqr93i5OoQCQ8kS
         Lvbw==
X-Gm-Message-State: AOJu0YxOHjfDpL0vWmJHx1lkjqLrxVjTT944t7rgrRblubWZc3HxEk4a
	RieMLKp3vRse+eBGU9buK39CWu3krr7wmISwT3pb7HR9VJ7pfXLB/GgvIIJPyDoysyrjwZ1WMxg
	ehkW8+C6MQ+aSEFrThCzCHDlpCrqdTHwjFCKL3IdbGfucA8cMfR6utmve2v7MLTJU
X-Gm-Gg: AfdE7clJRWj91bqlXpaAm/iZ7LEcDgaa3UwxCu+3mwHlkLUh3qQreEL7gAP+7NIkfwV
	ofhymm/IPs9EmZSurDQ4mIiGnqM6VrVifgI4uILJJ/l5lI1GY/Z5n/LFK3+eobImFmBOya+Dx83
	fRSTD1WvXKZEfeDFSA2SRnb3bttBNUxHQVscefBaZ84nSESj51buc0CY+dzhbKvSu59gucSp1V+
	tV9QiL/3LAMGQKBmaf1INgSBBytk8D+vDQHoWYJNCUSDb2lZprylkyV0PrS5zmgZjXfCCCYkCOf
	bAXq0CQP1clJ2P3tDwZlTjCJNfdfsHusRg6UW0iyDvV4RC7hV+bR6z+9ns+UZI6EjcGUikp/EV5
	BFQ/RceIoQ3101xMFT9EOxGRBtOkQEu/K3wjQjQSj7ekUStNcvqXoU0ti/wvT7pxNlw==
X-Received: by 2002:a05:7301:9e43:b0:30c:b149:233b with SMTP id 5a478bee46e88-30ee134cb5amr4459317eec.20.1782854788118;
        Tue, 30 Jun 2026 14:26:28 -0700 (PDT)
X-Received: by 2002:a05:7301:9e43:b0:30c:b149:233b with SMTP id 5a478bee46e88-30ee134cb5amr4459298eec.20.1782854787613;
        Tue, 30 Jun 2026 14:26:27 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:26 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
References: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/5] wifi: ath12k: fix dp_mon RX parsing for
 32-bit TLV
Message-Id: <178285478616.1590147.14797121014258214796.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:26 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX5Zu7RFvF3BTI
 COj0Z3kDIrfsRXRXtJeTX3kP3DQIdrO6tgytDNgn4fGjo9fq+YO0f3IusCQ6MUe+VTFbS1FLk/o
 UOJ+bTak/cU5IkEZ4dYRcGU4kqAN5q4=
X-Proofpoint-ORIG-GUID: moptiP60AD6rlxiodn5OpNrpc-VaniEo
X-Proofpoint-GUID: moptiP60AD6rlxiodn5OpNrpc-VaniEo
X-Authority-Analysis: v=2.4 cv=bNcm5v+Z c=1 sm=1 tr=0 ts=6a443484 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=F1YDBqfJIRUrzdMvX-kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX2Td7bm0Sxm+G
 pXLOf26GjL+OPhjmt7DiOp5QDanoJGUg2/7lfYqomgpJEjn00fy63z3MMojmvJpGZ+MV74gvzad
 hhL4hsDSEcqFZdeYKvrJOsUp6f7KKrSEMGbxFzuTtkwiBJvh0GqdhRkjyOscdeDqrV5b1JKYlZ6
 voXXROzUcfl76uZYrp0i/zb264guExkaJch1XUElqLV7sBUpKYQDP5vgtqI5rwMZlZZMcCk/nnc
 RDY6lb0f2wKOOBvHVuPS2pUr2qTpX8bbgsbM9p8EQqAXjRQhU6vTQv+Ay7+XTo++jYWBz9g8xAe
 aX0q8lLxy/yXOQMrjiYmBXMf6SfHaqIwJeHQUVoMordFV4l88UzJK3X6toXESnh/YyfcKqCTWLy
 DzyWm+IhfKS+/2JOSLSRdNVK1niwQ5X3ruX02SdMvnlVXzrGjAjl/BYTaWG7x80eSMk97zkj7fQ
 HHWsgL841riBeIDp6HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142629_524539_39B65CA4 
X-CRM114-Status: UNSURE (   7.20  )
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


On Sat, 09 May 2026 10:58:14 +0800, Miaoqing Pan wrote:
> This series fixes RX monitor status parsing issues on platforms using
> 32-bit TLV headers (e.g. QCC2072), and tightens TLV decoding robustness
> in ath12k datapath monitor handling.
> 
> 

Applied, thanks!

[1/5] wifi: ath12k: fix TLV32 length mask
      commit: d762bbc08ca70a1985c9f9420c4bf67e0ba0e9be
[2/5] wifi: ath12k: refactor HAL TLV32/64 decode helpers
      commit: e264a3dbe866870ed21ef83c67ad956a45391859
[3/5] wifi: ath12k: add HAL ops for monitor TLV header decode and alignment
      commit: 9d1d61121b05c0a854e6da227e37b99b3740dae9
[4/5] wifi: ath12k: add dp_mon support 32-bit TLV headers
      commit: 4c09bbf0c1e11bae19a0643bd9824d4f05d9c281
[5/5] wifi: ath12k: tighten RX monitor TLV bounds check
      commit: fffa54aeaeb2e9ac923254b39e89bf07799615aa

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


