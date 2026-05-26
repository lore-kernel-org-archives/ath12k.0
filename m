Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709EDCD5BC8
	for <ath12k@archiver.kernel.org>; Tue, 26 May 2026 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oN5fW6z9Sxv5LrKWtpk/pNrVz/RjeSZ2dahvl6Pb7/Y=; b=tDS9H/vjRAo43ecgT1uVvvpr8e
	qPiwcl6D/qQniDzaHjrFHHxx5aZBtGx8vVhgQe3XpeyBnxnz8ZJTYNybXviphLPNFDYr5uJqaWP9Q
	IxRQMhT7QWT7Xpk/eAAcyJzxfeEXCJU/hu3U3lyLsvOE46lZCOCRAbUp8us4prRh550mmyypz6V+8
	+ilo9deWeWI9NcckBsW/rntp7AWzhP0DRnjUGcfDYCjK9/Ewu1Yy3bQi8IJc4B74kUorT4Py6hzEX
	vnAr4Lm1REjndgAjkqXyRkSA19CYe3Us/bJpKqloNxhuHRucrAP8yB6Zyjuto0o3mEPq9rVOtm4NX
	iai9fE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuBH-00000002S7d-3J8d;
	Tue, 26 May 2026 15:58:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuBF-00000002S7G-1ZBP
	for ath12k@lists.infradead.org;
	Tue, 26 May 2026 15:58:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsYMm1575417
	for <ath12k@lists.infradead.org>; Tue, 26 May 2026 15:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oN5fW6z9Sxv5LrKWtpk/pNrVz/RjeSZ2dahvl6Pb7/Y=; b=aTSnsWm5WFHPAfiG
	Zun0ogL2CJOeJatnYBzeRQP+JdT1JB4rAECZPXTVcdQbt2IkgR84apib7UIp3uE6
	m5nytr1HQg6iD1FhrFDnM7egQRuBWs6x23vzTzHNlmq9I9BCIQoAk/9w3OJLlxq/
	Ow19mO1bbQRqD9UBJSgiA9KNs+nF9LmxXez5QnFjEscw6B8HyogWaXAvBfdeV+IE
	tdf7HrjSZsPSVRYK1T6c8bx0CBpkKZOdJQ8cVuxYX9kgNd6YfxSCMXJSoraWVtun
	zNcFn/HsFp4ZMi0SsITvHFziSOA5udqCcWeuqlIxz86xpnDq2HId8/RdWGTrnzNm
	vBuJ5A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwvy7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 26 May 2026 15:58:54 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1365eb2a74aso1283668c88.1
        for <ath12k@lists.infradead.org>; Tue, 26 May 2026 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779811130; x=1780415930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN5fW6z9Sxv5LrKWtpk/pNrVz/RjeSZ2dahvl6Pb7/Y=;
        b=LiaeytVKtX/P4MW9rEFqLv6X+T5eA0cGH8xwoRH97WzH0th0hJwzbs2C3+vItRsHW1
         C+7XF2uAgVSX/xsCF7xeUESI5w5MMgvhbz0wO5ym2aFnqsVDZDu8q6FDfIvvKoVwpKec
         HoxrE2ubVWtwAtoxISo/yAxNU5mp0hovMwIlCyG5oFaJTGrDGDgRSpwb6vieTZAM2ZSK
         z7MfNz3N70Nk0TLVYxHlQgceawvCVZOUBu1TcyHkULd0m5WSOwqTWO93iJgy/YlHWWsN
         RGWHXktPtcpZawEsJReC4gnuaou0QLZ38pZo8NZVCuhMp03+q+JtxbEmc+KisZcmfLWz
         UcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779811130; x=1780415930;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oN5fW6z9Sxv5LrKWtpk/pNrVz/RjeSZ2dahvl6Pb7/Y=;
        b=b1uHJRxo2ZjV/Ome3SUCONzx6O80JDqgiAEFEu3y6YpkmKETH5qoqVb9jPkIiKxrv6
         hLncQsXdlRes4AYVHUrmT6ANIPzp1LtGVxLPjDMOAnaCo05VAgAPmt1EnwEyRW03X60M
         dLnOcJ3XB3xt3zVZIENWHm7Yn0G1PRKPiiGAPWL1+IKHTMDPraKUoZrVqellTZ4PHm4I
         b5DizrRa2M8+hPDvEBufQ4EGDqUrL5pKxFvU1lCMH/S+HVGz3EZNiug0+0BEH9Yq/RMQ
         75eUv8jOIatCbVTRV7K1lDVJvGEf8S3BS2lBeQJo//+GHfoacn2yi8kBycF6cMTP+ECW
         wK2g==
X-Gm-Message-State: AOJu0YzMdDnGbsh9a4wRAB73vXozHZrPDgzLRy3AJM8lflfM4tXlvCdD
	Gwnta8iY3fxlpQ3RJSd1AJfIIHAuPyJQny3+hrQ53Vtqdk+bWDYxX7jJmXS4OJDXYf6M2/HhKTi
	SP0L/Pz4mPopKeXD5ZyjfDAEmcBHrnkPuvUznCPa5atzI3imwZ6LAqi0WAlb8n5dBs7nz7CVq
X-Gm-Gg: Acq92OGsKE/shguYnuvJ6FzU6s06Y0WhQ6pEW5AaZGOEAU2EOeT6VZ2k504XISMgLQQ
	CO4EOC9jtusZQ2jW12S19D81HwbyHxCw//JIqWTw9uN3tP06JzQDgNgY3XKDHHfxwbuUGhEUZPo
	uKfXM1bwRiQfo53Hn9P4zNn6VEiBnv7xhvHcD/ruIrEwn+HLR22fNfrMTsoO8Vqo/RGg4TzluA9
	5c31tsKsDrpEQZpvaLewGWtzI7KbdhJjafDz1ejDkC89s0NgT50qbS95wY6Poi4h2XbLcaJOQSH
	5D2goZUcCh8efdNQfqI9kgq1F7FsMl/odsftLSVygc4Q0rFSExrYNg/EOSr48PGx0Wtx02iyxhz
	h/RqdwDDH3xkO1RpWaFMGkT1sZaabJpVhvhd1+0t3+uwPhaWjonGVG5/uzgZdjt6U2ho/0yPtoE
	J4
X-Received: by 2002:a05:701b:241b:b0:132:133f:63a7 with SMTP id a92af1059eb24-1366129c82cmr3517284c88.8.1779811130405;
        Tue, 26 May 2026 08:58:50 -0700 (PDT)
X-Received: by 2002:a05:701b:241b:b0:132:133f:63a7 with SMTP id a92af1059eb24-1366129c82cmr3517260c88.8.1779811129852;
        Tue, 26 May 2026 08:58:49 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366a2e672asm10449396c88.3.2026.05.26.08.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:58:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Ripan Deuri <ripan.deuri@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260519192815.3911324-1-ripan.deuri@oss.qualcomm.com>
References: <20260519192815.3911324-1-ripan.deuri@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix error unwind on arch_init()
 failure in PCI probe
Message-Id: <177981112914.2898644.10933293159211172747.b4-ty@oss.qualcomm.com>
Date: Tue, 26 May 2026 08:58:49 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: yoMpUnWcE5cenl7htR90-5SwUFDBvjju
X-Proofpoint-GUID: yoMpUnWcE5cenl7htR90-5SwUFDBvjju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEzNyBTYWx0ZWRfXxlB5mkuaZE10
 t+odFMdQl2zOKQJ34yTcxXQ/neb3ICiLM8RwPtZnt1dO1Eglj3pEPM1vencChm9E1akGjMGxR/x
 rnwPuN8I9swpyCzirtqUAdXxOoF25Ju+LIRD/3+CnCC8FeypV70ovtDu7QhJaGmGDSGIcOWeIfl
 R3KB2+GVAoXfWmF1LflqYe4C60nLx4uxDGdfWPSrrR7i1rqilcssmASJgfK22y+IABjU2v1oZmy
 jYZrsbrR4RGN8aXI5u0gRa4WrXTIWXPoUxSB+8uCVre2OU0+HL+NPq1WFoCxPIs5oc1di/Watii
 JhEesViu2Zefds5xgC9ODdNGcn1sma/54dNEpr2qkq2iRUBiVJwWCB6zpDI+Ln/N0ekghUAViht
 gLW9AQHi0PiVLIUAQwoPc/Bf7SDqOzy14N2NMOu0vKl1U4RQDTOK6oC+VF3Vr5PZwI51h07B994
 p2LsX3OU21osu8l3moQ==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a15c33e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=W0DvjKP5zDoBJA8oHBUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_085857_441538_4271441C 
X-CRM114-Status: UNSURE (   8.41  )
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


On Wed, 20 May 2026 00:58:15 +0530, Ripan Deuri wrote:
> When arch_init() fails in ath12k_pci_probe(), the code jumps to
> err_pci_msi_free, leaking resources in teardown.
> 
> Redirect the failure path to err_free_irq so teardown matches the setup order.
> 
> Compile-tested only.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix error unwind on arch_init() failure in PCI probe
      commit: d5c336161088c588f85da64f48ba6deead194afd

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


