Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69929C54FCD
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 01:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1qmpOfUAcw+5uVwQaUf8YL+ljdwyXYtfuPlud4dqik=; b=OpE/gjMIb3U6vsk3XJ263CpwF2
	8kPH55Zpg+AGqc6FDXswzBqWOxFieq5ix4gD5d5eVJlM1apmI0d7eo/heMqgQv5DOP6Zfdbnxox0g
	SQWSMmjGOTaDloHA4qRMmcoPmDkhM8TaYUm8gvkeo2M6nQSVLoCZN2VMPOThrYh8u/tHqJ8CFMTsb
	U8ZLP3HTOaqvNsixaYB6liq/lk27URm1WHEMhgAKO6CfssJdODi/iP5xZbpNfYtAnLn7gyLdY9DKE
	gBMAx6CmY7d/NfsOztZNj17GqAT9STClxqoLiAIVNH3b/qUN8bFXoOfZmWLXXuxF+i3rr3+FXpLZ8
	n3v9Guww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFxe-00000009IVP-2r9x;
	Thu, 30 Jul 2026 01:53:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFxb-00000009IUo-4485
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 01:53:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U1lucV3767300
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1qmpOfUAcw+5uVwQaUf8YL+ljdwyXYtfuPlud4dqik=; b=MZE1RnARuNWjWpcD
	joGo50u69+vOarx4Kq8btM7Asx0HhfHtbblvT1GHmpxnRke0HQTLJdV05214La7Z
	S1PBabfKHSHb8S9m4q9alvspjuaEUSBeLtPU9YjVOMaSAxFIMeBxG/4K0/8FOTof
	O5uWf4uP+tsckCHuoHxcUXkbrNaX6sW0yuZ9eIl581r18/aSxYiOAFyMSNTJhEXz
	LHTdsrA3MiU7KxfUAP42X4MSGVzfKHpIVJfxR00WN1icAt04HOv3jFfqgKf/3Sd9
	hrJVHCNX5NvkLQpJM/iHmj/EP9cd98R7g5Okm1oYzeZtOWgkaDOaAAFDMMBOIYUS
	VhtrPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqw9000hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:53:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484b9fb055so3729539b3a.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 18:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785376402; x=1785981202; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1qmpOfUAcw+5uVwQaUf8YL+ljdwyXYtfuPlud4dqik=;
        b=ghWt+gGZxHwNSmcSumTh9ewOZJEt5Fuy1RwvRfMUAd8izlMUpywl2HHxvAD2ZAAX+/
         KVj8exnjynB40TtltpQh9X2ozfubiIGoPAkudfRJaovnuOg7SjqMpu+BR8/+qk1W0P2E
         YKlx5F+aR8qlTpzQI7oQgoyyMXaBlRsRsLepsGiIm0KNAnnHyz+iEiv1HiEMUM0BJZ/r
         te/jWz2XO4zI1PSFzZo1HJvNgwe57Iqd8UcbTuTf6oznyy8zLBqsrfpoAwPNd8xsqoW6
         0T2Doh3mtSh7DAkw/xG9QvrPIk6sKdppfM3sckH0A09LEl0YodtS5V0cU3sExq6X7dIO
         72Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785376402; x=1785981202;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1qmpOfUAcw+5uVwQaUf8YL+ljdwyXYtfuPlud4dqik=;
        b=MlpdMbXKD2yE4l46V7KQgzGCdlJre2tD4JuuLtJs8PbDzqdoWc35Gq2tDdMUFZgIdE
         5FXj3BzX5T4OS+cn52JCvZPEdvViake4zexsFk7/gLcrk0EdFIDHl47U6XFpchHkDHrc
         tVNI+XqkKW6bfTkKU7Q8hMiFYH+Tae8mUqTcVcZmxP6eKOs+1CYjPPQ1efP5Kl8rEHCJ
         fSi8rcA0lIqGirKSeiYbj5YT/TVltBQU2ODV9N0yp8z3gTIMvdhe1IRjB7k4Y2d54/bG
         1qpVAWHEWh0Iikaul5CF3i0ZT8vLVftGjW+yVHkUxob8Xkt4BY2HWIajyWMrgdJvXHTw
         zspQ==
X-Gm-Message-State: AOJu0Yyo5Pdw/W1x44cNkTjpwKD92IMTwI3hT9yuv7M+n8+Ewu7PdRzz
	IriI0HOS/KoyZ0pRkx9S0/DYSC2e7Ajkbg8E42M0ix9zC1axceqTlYZ74ov0C0SBZRiFYpxuQvl
	ZX+qtDIKSHB/9Nr22mquV5aKdlboB20KCmF5cSKHFGbScVdG6irIDQX67bfwftIDC
X-Gm-Gg: AR+sD13c5vUtxN9v0KDyo6fNpJldzC5avnbMPkuhZct8Z6ZQIZHZeap9wsM+K+1bg/O
	xFxdNcRej+111hZjXNoz7YIurCPTtiQ74X5IVfZW1zV/J7CWTqeEVB5lPVGpLiBG6DVs2CyA4ls
	kHSK8m/ObWa1+FsJZWlGK9EPjs2w5p+oBv8dqDtZpmg50K9OgbPgpbhT4EpWkCWNj3fTs6apzT9
	o3eou30h7kt4vpdnS7q/iw/7tyN6Q+XCdGxUkMQ8Szxv6sWURevAlEFRjh474TWRNJ+hvEJZFlj
	OZILoHSkCDTjk/nNDCXmv7hFWyEnTUASeLpVhl3OHK0EY/o6Zfy0OfIVMedM8wIinOyqBbKJ4Be
	VNmqkX+eKUDF6LxV+ps0CMiy0fpZfoyUGpPYR6cMmMBjx7lB+r2jyta5rj2Yjc9x2Z2dlry2Pfw
	==
X-Received: by 2002:a05:6a00:10d3:b0:848:4faa:480b with SMTP id d2e1a72fcca58-84ebc217d06mr753746b3a.12.1785376402442;
        Wed, 29 Jul 2026 18:53:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:10d3:b0:848:4faa:480b with SMTP id d2e1a72fcca58-84ebc217d06mr753713b3a.12.1785376401976;
        Wed, 29 Jul 2026 18:53:21 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0374c15sm2130159b3a.51.2026.07.29.18.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 18:53:21 -0700 (PDT)
Message-ID: <ce9e9251-8b92-44bc-9807-a527524d3415@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 09:53:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current 0/3] wifi: ath11k: fix QRTR readiness related
 WLAN initialization failures
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730010505.143458-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730010505.143458-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxMCBTYWx0ZWRfXwHVXHt2MDaJf
 gWJd9AT/kqiTjJjYRDczumLVkFVqoBiXFHlH1r1fg55FbqL3SvYDRt3FdIg92QS9ihmyQ+fy9qJ
 +69fgeK/aAyr4xatcNjxW0PnXw6gRSY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxMCBTYWx0ZWRfX2Caol4LFg6Uh
 2R9v6lMcQRiSMEHSJRLlMDa3MAPuF8I/c2+kb78VaD4vmVYU2yIhOgwmSINZsTJBVJe8lxTd7xF
 Ges8r48HcwVrse9O0dXBsQAVUiZ/8fAJzRjrmffEfg4FDmGv8BmIXOIEBToHwVHIlIPPUG8ImC5
 xRnLgpQ3jxsWZyrCs7i2arMxRyGvPaWOj4gRm7NYOY/cO+/+ZIMCmgf1cnA8JHTSPa7xOFuth3p
 tQzgNw7Ch4i0FDm4sA12ft1KXiPxi72bZSxyoJPDKyWygJtqCo60c4bGYdmSHVjcGZUCHxcPWSx
 h3WSzxptzETkr3CjtnfiEYQ6dXPyu/telEIGiMZSXH4R6uWzgmDtglp7T4dDUT+iKdZKtxPevOC
 pfF7vXN+g0ndCcIaAl1KtARMgceLwXXO9GnFQqO5f8yIFV/4AAd23+gtSQ3IN1XE8cTRaMNNkdX
 qHDIByYinrMfsvx1NuA==
X-Proofpoint-ORIG-GUID: jhAj9wv2CaVX6LCqwWJXancSMvqw28C_
X-Authority-Analysis: v=2.4 cv=UJDt2ify c=1 sm=1 tr=0 ts=6a6aae93 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=T3lRSWXN8vyyytrHHXAA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: jhAj9wv2CaVX6LCqwWJXancSMvqw28C_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_185324_016524_6ED9D57F 
X-CRM114-Status: UNSURE (   5.56  )
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


this is ath11k patchset but you are sending it to ath12k list.

