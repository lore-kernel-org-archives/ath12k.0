Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DC7C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 04:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKGHalJjL8+CmSeiutqbwRLhL5D4YU5/vZSAJ0iuwr0=; b=gkS8slUnXNKBXnWmIyCzOIuGCN
	cS60Id/DBhhtLcQ9xiWamHaMCsmZ+NnSU9JoSxjVwHlxzDpoh6puobmDXWcN9Jz6pVqFqbMzMsBs9
	/f+ezUyFetgmZWrDQZqngKScsKAOFUU+/mU6gJ4nuRa+mtiNtKFfghgk9nSR4P4rU88d0wsilJdHm
	YbP6sRFXFhlRAPqx4ZGijBKlwiPyGsx3Q3cNudbYgc5EA/5OIs6Rxyb7k/Sz3CQR3xPaDzgFAge95
	qn+ZfRMkHhM4meFPcImTvh5ONATxIjigtNgyV6kUhOkSSbHWEbZePynsa77AkciY5ZaW5DyFfQEgO
	UFPfUrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we3OQ-0000000DfPj-2TnM;
	Mon, 29 Jun 2026 04:14:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we3OO-0000000DfPJ-1G90
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 04:14:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T2crsT1543578
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 04:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKGHalJjL8+CmSeiutqbwRLhL5D4YU5/vZSAJ0iuwr0=; b=FZvNBSZEKQqUmnpB
	caqreg6x2FuUa8Qp1oFH1NfNIUzhGZTB5MjYjTt3KO+W+id4zvnEhZ1boLJM0L4b
	+q/8rnJyENrTWfDncm2c0s9JAz4jhpHIHP0kN/IhrYU53srzkJbsyLMmYwwYZuIM
	wIadVu6eYBVe9CNr5ZOktJkVVJA8VL59vcDi32z3tXw3EAwlMrsJVeGgD0XnCVMF
	wWYmTDVnZVg0EX3TSxOTAFnokeVch2VGG6u5qRQbbn4uTkOfDY7nWvqA20AehDOH
	TxO01c1V3SLf4yHYxIQo1DyApi7FiSFc/YGtf5TZB9S8dPFOIi3UiVr3zmSOjMsG
	aKVdGQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tumbja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 04:14:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ed53abff8so189895eec.1
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 21:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782706482; x=1783311282; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKGHalJjL8+CmSeiutqbwRLhL5D4YU5/vZSAJ0iuwr0=;
        b=aCDRxcizuOtTs/lb+fCmL51iaj/h/Agr4gwHMIHL+05i8/VwjpJAV/hMId3GS3woXG
         oJhkXSsIGtW2X7aX8+wN4UO72TaluAQ7xJnl7HcVurpspiszr2DtBP/mINDPMv8bY7T0
         xTO9Kpy3LdTo/jB+ahMo/lpJmqAJynIdL3akDadIy/EQD+jyGgDL2WPbEzesd8yN0ahv
         3jHUs1jHk3yuj0OhP13sa6s99kIe5NqucTt3/OxbBwQDNpa52/FEWvyMElvm+BNysURc
         HV/nyHLs5sXpxR4dtULlYbOsBeKu4lxGvJG/62aZyghm8WUAUm6ZGjArLZwZXv/3CDRh
         2Mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782706482; x=1783311282;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKGHalJjL8+CmSeiutqbwRLhL5D4YU5/vZSAJ0iuwr0=;
        b=qd+sDDtBC1Ri3Hxsl1pn8q8Dre4tAC9dXRpCWwP/ul5w9BJZW+ivHB2/q/Ua14BnCA
         jhEneh1YwRG/uHOafft4Bu8gKBjivaJz5JWvvqLgRBYkhMm8/SFiPibw0gjGDf0DWzpj
         vmaGPQJrGdY5TLKbaZFWEH5Mk1ojImJ+X8z5H1NFbOnns6gDepkdKWvg08XcuT4Hzttg
         TjTL4TzK2nBBNaFiAGg6aDsqLp918ttS4xwE63F54V9X4viD6+Xv5dD6Il4F352XAd32
         EdMVEek1+Nbyenl7kKarkwhVxdfSAgW6JNepMxVrcgRBPqopGFtjDL1gGQgLKSflLNnq
         9GLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+HzSqThu3UUFVHdGpjmd+eHvRacGOdoo8mNgXA8fASoHSlNxYwOYBf43haCAQxMkSUxmSu+o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfr8bx/YnUjfVcXg6F7ZWRpKSL7fsgNXvfPqWR9xOQEnVborvL
	Oj+4iDnd/JLnm/PzPV1npc4t1NqYQ+O/GmbhvluGdrfufy6uOsE6Myu4aYM8cK6r4hmMF5rSaSe
	xyGjeYcOX6YzpeAhgE6un3hWNt3kCB/+MF4eVfPRNP6oMhODE6Jfc/xGfovnA9vVNr/rR6Hhv
X-Gm-Gg: AfdE7cmj5NEcj/G5/osT+VUTK0RJ5ZUpU+/6rgnjMWWXgJuUM12G/jQumIXdhfAsWvv
	p0C268kO66vW2Zn3WtZzzQb9tWaXh4RyeEPoaNR9HUEXfKLFrYQG7cFzVU5oCzv2ZFrjBohsXFk
	okVLLFpXIn4SC2gHRa0RmNR1HqYZifdJ5bW8avI8t07G9d4dj0YOAp3R16k/wPLTBktYdiFT0af
	q83vGI3CDs0gtVF+IL5HR2PZphMrQNcA0FR8XZvc0fGTnJU4cMmxsLcefapIi5X4pqcFfe/qLst
	HKhIjKTfILw/BU0Y5j5/47h/vTpo03aoVRLCC0jshdvVHAKb0HLmiI7cn/VrVlQ9ttSDgs28dRu
	b72hkvAh/jn5OzZ9kogKGgh+WrNE0ASl9a8JoscOQTK5jZsYEwRs=
X-Received: by 2002:a05:7300:3256:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-30c84eba0d2mr14876887eec.17.1782706482235;
        Sun, 28 Jun 2026 21:14:42 -0700 (PDT)
X-Received: by 2002:a05:7300:3256:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-30c84eba0d2mr14876866eec.17.1782706481719;
        Sun, 28 Jun 2026 21:14:41 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ec3e400a2sm11566769eec.28.2026.06.28.21.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 21:14:41 -0700 (PDT)
Message-ID: <af592fed-313a-4bc0-a4b3-f04ca0ffa6fe@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 09:44:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: correct monitor-mode RX
 metadata handling
To: Sushant Butta <sushant.butta@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260609064856.547032-1-sushant.butta@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260609064856.547032-1-sushant.butta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G_EnZFARLFXkR-bm5KLugLI2sZGCYFY8
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a41f132 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pBvdREmwWComYNwZb9IA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: G_EnZFARLFXkR-bm5KLugLI2sZGCYFY8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzMyBTYWx0ZWRfX+cSeiH/BQqjo
 SyQicdgspSwa+fKfCZlKTyBgJRh8OKXB6Kv+S3wZ74Co3fhl0OD/fn6DQloGDvgmefTni0tRkei
 RXrchH1m++XwIMJkrr+aBIhc/Q69w4DIft3NbIf8IwUzKgJY3RtNfpooKdcv63/tXxp8zC019Jf
 aeTgHcTgGHW0hAC+B4oXupDRrv+MAmaljwa5SlN1IhRsHt0cSwjDkHwvmJ82U1T0sWVJ0Myjygg
 o45rENnIdc7sOSL1xE7P4z4nE2sVrEz6En+DRaf7scKIdrWF/t/fJ/3z+bZU4JTxS34JHOrVskj
 5OTZo79xQta1oAc5j8QO9gvPpI7qBXHL9DawqjumVnKjtSQZgrx3YFQZ6ZUID6SWvsW9ZZaPWQ0
 fpE5iiMBWJVjkv+QGNBIgF2gjImGzd22F94ZIA0it+TUkLInCoPquJzclIe+nAFkh5R/h00H3jb
 KmLuKx3RIM3sXeI8dWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzMyBTYWx0ZWRfX6YRfmyc+Bbsu
 +OoN/LzXQN+2zt9jVznWDqeO+GVuQkv5WyHo8+S0wnoGxQGdXpGhYmdC4f4K9tLOo3iaXoIJwEW
 SVJT2+jzE+HCy1LzoEPcl0KGG+vDvhw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_211444_368633_F2394CB2 
X-CRM114-Status: UNSURE (   9.78  )
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

On 6/9/2026 12:18 PM, Sushant Butta wrote:
> This series fixes monitor-mode meta data handling in ath12k and trims dead code:
> 
> Monitor mode delivers raw 802.11 frames should not set RX_FLAG_8023 flag,
> and populate peer/link metadata in ieee80211_rx_status for monitor MSDUs.
> 
> Sushant Butta (2):
>    wifi: ath12k: Skip setting RX_FLAG_8023 for Ethernet-II (DIX) frames
>      in monitor mode
>    wifi: ath12k: Skip peer link info update in rx_status for monitor
>      MSDUs
> 
>   drivers/net/wireless/ath/ath12k/dp_mon.c      | 70 +------------------
>   drivers/net/wireless/ath/ath12k/dp_mon.h      |  4 +-
>   .../net/wireless/ath/ath12k/wifi7/dp_mon.c    |  7 +-
>   3 files changed, 4 insertions(+), 77 deletions(-)
> 
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

