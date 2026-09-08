Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFC1C79FA1
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 22:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDx0rDDViSXpY0EaEWg4SGxVXchArhRyGAl+I6Mor5M=; b=xQ3fpTb8P0RS6cl7Iq84AKIUQ7
	Q+RV5oBxkQLBwK6DlUqhPArGeMM4+MmWk+NxbEyJsZMbmg7tCXcIfVTKZxOoqwdnGOLmJFh2hz+zr
	epuomzg7gATrI6WIg0TKmV6PB6X4fWgIw//Q6bfwyslYl1pwo/M8tPPS9Bj2D9M3UMv06zyUrNqFE
	cICmlfR5hZV0Vrjq6LzddeTnbf25aJLJVtwPELUhKryCTmk4kK2LzpKUeQNrE8ByXyuEeT1XYXXeq
	2l6OBVaj4q9BJf/I5Yre72DxkUf/jnc+D3QEI4+sgX9+KiZXiBcDSG8OHEgxpx3lCgcoQaujH0lpa
	nraPsZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43yh-0000000AN2K-04Jv;
	Tue, 08 Sep 2026 22:07:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43ye-0000000AN1d-3iup
	for ath12k@lists.infradead.org;
	Tue, 08 Sep 2026 22:07:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688GLm0l3502003
	for <ath12k@lists.infradead.org>; Tue, 8 Sep 2026 22:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sDx0rDDViSXpY0EaEWg4SGxVXchArhRyGAl+I6Mor5M=; b=B2C6lMsxRxGzWSR6
	4JtaA1kbHeEj7PKX179JB865ge8thWxDRxZgp/ElDdUm1kt5dm9efT1b/Jcq/qLc
	6ZoHZehzUIbVVAhFv3qZ0gR4MuEhSlzR7XDbZIswJK7UAg464+jqY1+GzxgdkjhE
	rIbMb8qz0WZ1Xp/iEVUMyVemJvEeaPiXj3qMOXxlCNERXNx2H/vW0ffuEDcwlVxQ
	2dy2nIK152o0/93BKQ/iC73fWa+UBQ325sxGA/wSPsmroH5w2bYy8y8qm5fouvi4
	CIQDfP3NUMV6JFaz35FRZaT52I+ft09u5d9jgsNYvleS1FxD+I6vtEhu7qEm8xdF
	ztYwNA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntphg8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Sep 2026 22:07:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so73544035ad.3
        for <ath12k@lists.infradead.org>; Tue, 08 Sep 2026 15:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788905258; x=1789510058; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sDx0rDDViSXpY0EaEWg4SGxVXchArhRyGAl+I6Mor5M=;
        b=QKwVfH60v1oeVZ28odNMASifiOsazEvzBVY3ASnwuZiIdu07+SHN8G0P3fzMBQ39hM
         Woskoo055ltIdIk9bY8QTZ510gnXSpgr6Jqu1QGyeDlhSb/FmRWePhCvdWgzvVYLRkfa
         XT3u9a+UNOra5LjibRjiu1GYTVCt/k6wg4rJndIDhDv3QPfh1xECvV5826/7fVdUKzYT
         9uVsxCNjLStKQr2qJ90aR9VWKh0hclOeourjL1c+E/Mav8LMmPa7jiN6dY2p3meRbyiM
         QKI1NXroyVSeEP3XSChyYfWg4AcyKvCq/rSzTF6q8WqcW4p+LPJUne0ushkYVtgQz/4/
         RU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788905258; x=1789510058;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sDx0rDDViSXpY0EaEWg4SGxVXchArhRyGAl+I6Mor5M=;
        b=kcC0VgckVVmqiEm0D8S45KcHTsGbgI/PMlnzeaEnuEfWulyksReciqv+QeJtrhmQay
         8waAUJpCN11aAWBPVZkRgPWf1sMdKfMJPqwM87bkGlgk6JGcQvC1/I0sLJ1K33JbPeCm
         yv2Nskmlde0gB8IRAmfkvEzRxjLlu9J0ZgqV5KZI/reIcga1xhb/wRUH3nqmL+0HVIkJ
         dAnM7pqFrOmjTXXlAGbISEdJOuYKTEzKlU9vSKOvaRNFx96mRJawZF2KHblpiizmCGIa
         Gl1hEsl8mEcsLNRBdfbcF4RHAch52ZYygaURJHnbUNczt2vaYeHT/PNzt39fDXFrnfqL
         m/mw==
X-Gm-Message-State: AFuF++l/tVOY+IUm55iUlQtx3rs2eTeWYc4HEAW9A0frr6mNg/RR1U9p
	rRQFpLwtkTTvcdstNbPXX+iGI4FVMQMc8U1wlHe+JnL5JqHAkworWSsC2FmaWqErvS0OXsVQkFK
	CLaSG3MMiQX3vuFn76JzdqTP7JOHAFFww0ZIPAnDZWgTVNmxQP0nMNq9iE8Ktr6aGWKkXDB7O
X-Gm-Gg: AYBFou26Hx33+smEj/ffhUbiv4XUgVBAjmYKlNNU19ycs4PFqHxyOA+6Xve6p9c/9eP
	3Br5eynWHzdHzVGEYSUJznEFWbYTLRUCdIEa8DI2tlOLwUxwFp3LPrhX28xwp9em3orO1F5xnrl
	Yj9me7zEVhBxRHZY/Y48NMrWL0SdNBheZJn13e4IY1MLkFYPIS0INpFUZFRUNQWrnxeqzI9VPtP
	XK9LNGaM/XdYoZ2GgppAcMLWsPis3uEBD08Z+rGB18gvxj9oA+5q98vdM7P9CVX0aYoiU9ujUNH
	25irkfEnFEn6MSwsmO1o1A0AyEF8KR31p5QeR5MyTb+ei3xHESi3xhnIICeh1oGAoo9lf+g1BOr
	hWMBK56m3ks3ZBzZHy8TA0TPtI7jDaVf8H649+nAzWJHCrjoanUyHsqc=
X-Received: by 2002:a17:90a:51e6:b0:39b:4877:ae90 with SMTP id 98e67ed59e1d1-39b4877aeb8mr21450802a91.22.1788905258553;
        Tue, 08 Sep 2026 15:07:38 -0700 (PDT)
X-Received: by 2002:a17:90a:51e6:b0:39b:4877:ae90 with SMTP id 98e67ed59e1d1-39b4877aeb8mr21450759a91.22.1788905257890;
        Tue, 08 Sep 2026 15:07:37 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm46411813c88.5.2026.09.08.15.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 15:07:37 -0700 (PDT)
Message-ID: <e7a1a2da-bcd9-4510-8c26-c049064d68eb@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:07:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: preserve PPDU state across monitor
 status buffers
To: Tamizh Raja <tamizh.raja@oss.qualcomm.com>,
        Kang Yang <kang.yang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20260828065534.1537-1-kang.yang@oss.qualcomm.com>
 <CABkEBKYdFcUfMGj1pGmVYrdLQTO0eExq8Z+vMdjYGN+yjQ2uFg@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CABkEBKYdFcUfMGj1pGmVYrdLQTO0eExq8Z+vMdjYGN+yjQ2uFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDI0MiBTYWx0ZWRfX/+vmGJYQZ9mv
 QSVORwU/17ii3bUnf8u2wr5EVM5rW1L4bMhBUbidLIHmyOXklkGP63V8rqCgXvZgZwX7U+CXVj7
 03O5KxtfdRwo9lNT+Fp5x/XicT7gt7bdwK9ozmB3G9WK7m0n8rb83NrK75RLXtiixOyE1LiWUfG
 +tQ3p8Wqfu6ei8HklvUE1KNaOg60/oZeiBA0tR4DMnPMY7OwKcQTdcqi+PvvYVJGuezn7HIp+r9
 9Dm334ZfkUXRxZoVqW6iMW52dmyq+wu1JtLiQgz787IRqVBt9r5B8ptjU6yHvtmBz4F9bz/9vRx
 7vIJL0gF36109c9xsZQlz7y25nHVWiMFR1gMKciU0ETB28XUEDwk6m8G0eauiag1s6BqzkpAINr
 FjqCvPrtCmypNNwUwNCnF6IJvPKKYWxF8MZtc1OPNUlZQrLMiTmnpvC8naRxhG+B9596YbuZDRo
 SdK0MDIZhoYbN7VHdvw==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa0872b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_6vQ7MnOLTxtXatyMLIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: PbiNNSdpCqeTIratST5JyPZI-WnFuAND
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDI0MiBTYWx0ZWRfX9wGkfWUDAsN7
 RAdm0EY7UYIvq8KgFcGVUb613s9cuInopHW7UR7IcRPpzeq8Al1/1SAG55QZNtispFitSbKcCSZ
 XqZ0sBH1QBPW8nooCiJbEhdyMJO8ZCk=
X-Proofpoint-GUID: PbiNNSdpCqeTIratST5JyPZI-WnFuAND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080242
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_150741_049284_0E77101D 
X-CRM114-Status: GOOD (  12.19  )
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

On 8/30/2026 10:53 PM, Tamizh Raja wrote:
> On Fri, Aug 28, 2026 at 12:26 PM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>> -               if (ar->monitor_started &&
>> -                   pmon->mon_ppdu_status == DP_PPDU_STATUS_START &&
>> -                   hal_status == HAL_TLV_STATUS_PPDU_DONE) {
>> -                       rx_mon_stats->status_ppdu_done++;
>> -                       pmon->mon_ppdu_status = DP_PPDU_STATUS_DONE;
>> -                       ath12k_wifi7_dp_rx_mon_dest_process(ar, mac_id, *budget, napi);
>> -                       pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
>> +               if (hal_status == HAL_TLV_STATUS_PPDU_DONE) {
> Consider HAL_RX_MON_STATUS_PPDU_DONE instead of
> HAL_TLV_STATUS_PPDU_DONE to match the declared return type of
> ath12k_wifi7_dp_mon_parse_rx_dest().
> This is a preexisting inconsistency, but it is good to clean it up

Let's clean this up with a separate patch


