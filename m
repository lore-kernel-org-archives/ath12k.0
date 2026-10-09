Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF17CA601E
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 23:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orfUOzgOKH2fvhyFNmsCJ3T9j7vjj7UDmnHsEpSvVwI=; b=cx7trKaVEswQjbVcawdCVRGyi5
	pD3bhZTOPl8xE+eIi8hch7J03nhuxjoGOSI+V215/bT7l7UTcDq5slRef/8YXNGiWsgDkg3Kk7zUw
	G3r6Pm+kuxTNqRbp+Wx19QgLB+p2BNB5Mb0gajRRzSmF46D0Lh0ojDF+lda6qeelVuHOJtQk4YGzt
	Trvbm87PfGVm71uQblVNJ8Jlsxxwh8dsgU9dWD3EahfW8JYIaK4RaBKgRW5V7uDyqINrxTi8Kffax
	FIITzx5jZaUcJAhk3mMqMHfJ/hQRiMt94W5HmoC8MYT+P4j2aPnpTWP8hY83+0IYsyJqhC3P/woNb
	EPzxsIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFKJ2-00000007LH4-2rmw;
	Fri, 09 Oct 2026 23:47:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFKIz-00000007LGc-23ew
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 23:47:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699NKO6v2871174
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 23:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orfUOzgOKH2fvhyFNmsCJ3T9j7vjj7UDmnHsEpSvVwI=; b=AhRY/OcB/Oym0G+w
	roAxJzrTfMAX6Mr/Fa8rnytqYCtVqm/IcIdqC/YyS1qhQCzhjisGvCtTAURkaIiW
	/IESqlf6dWy6+9nZNBcpnBqMED1nIenvn3798QhxvSVojPRyTJgodMvAZ1ApoEpL
	J130Qcye4OKE9QeWDosnbMiGvgfo54aClTMWm8oBn5Yl+fqvbm5YpnLQQvWVF5z9
	84A98qcC2A3KEe3P7BrkAkejXtopbIWPKvPr6UzkiVukSD84rJFc35tp40MQqbUG
	SCPEX8brUTBn66VkveZv5qGn6Dd2vRIxmr/ExF1jxQ+1+60bczgLMztNIr931MH3
	T7j20Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7s4t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 23:47:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef0362d95so528535eec.1
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 16:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791589631; x=1792194431; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=orfUOzgOKH2fvhyFNmsCJ3T9j7vjj7UDmnHsEpSvVwI=;
        b=M5kCVRVBWqsbiMCq7h+CDZGvfv1BwmURRi70qrIPdocbgrXuM38CmcjCRsSa9QKcCV
         2tnjKI3+VP2L2QqAO9yMHlHeiEopzn02VNYK28LNY7creOv98r+nPCjW54/m6uF9q60J
         El2u1k4jreMBCVxA/VKSo5wsBHWDN/9vzmJs7sJbUmBeLKF7y7hUsIn12uMq2FZiTnLa
         DkAb6BiVxk/LIGXM6YUvHZmOTDwFm7HLU/fhZcQTeIjdJ94NAOusiod09Aal0VHvZDvy
         51z6mRxGl+jqS3lvHiz8PEpI5xQDwVGn0PGgxFPRir+7sysv9frbl/YY83T8Kr6V+jTM
         TZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791589631; x=1792194431;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orfUOzgOKH2fvhyFNmsCJ3T9j7vjj7UDmnHsEpSvVwI=;
        b=cbttNTJ4kRG18KO194tnGZ9eESVnbYCP66HcI91yB66AvMLTSYaGPRPVR7YKPKjbpr
         vaq+ADPVxq/v0wJ1bqYexkUu+Ko+c2IkK93z4cvN4B1hWgGYZchws+qDK1mnfY3C0YuC
         ea6Q7S4tfMzsxj8cc2jxyQb2Lp+1U5A5460PRs5rvBAo0XII8SA7HrcwuI7QI7ryiE0f
         vZTeA+DoxEIIcvn5p0Gw6rqoss7YRtNbDbGTFNBDEhg1A8ejkQxnwcoAa5zhJwlwTMcp
         tlEZMwtTqVtJigUL1ygis5Fz0RV1UmzPvM6g1sDrQNHwO5c5GIeHALED9NqstXfC6gS4
         iqKw==
X-Forwarded-Encrypted: i=1; AKwUvBx9Bq4TRps8clashWlBzCIXR2Q5dUdNYa29kSUGCAL/xZlkOwpxYAHDzP5WyzX3UL8PjO2X/us=@lists.infradead.org
X-Gm-Message-State: AFq9FYK94/YZsAjq5ohCwHkME6xZbn3YkKHdLGvl6JrO2FtUiySy0Rfr
	5J+pm9Dc4mWEycs5nsGfCHWo2GQzDkNRQ+rXVqng4eufnCb70uGGNX/HfUKq3IfiIFLAjTuidGa
	XJIgON0fuZn9jDo5D4+ept8A7HCMH4MLImhlt0A87RinkFvQuQqqo91tX50A/UEtS
X-Gm-Gg: AYBFou1jrE0DcXTzuGfYt/TkcKKy4U23sRnA+ZYkhwN/qAtBCKPEJZLMR9jRk8r3QEF
	3SSDI/QoxyPSwO3kPAK75PPQWJv/md8bdyvZ4FuLLnRD0EVMLwIAWksczNvKYWLzaKfL03PcXPf
	GBzjzNckjKQG03L/ZndghDd7Pk4/ovEBkx9xZ1gBCJwUjXzBJaQqnbePwsF+Lk6wNZ8ZsmAi5L2
	b4ag/cikZzGUkwitklIFoZm7qDyHAAmVbdF3yTpPry03G6imGDE+KYxZlZt9FwtS7YnmAVx3Bch
	61ZHev0hv7Zjh2NICT/igQriGKq7mEPbyPsrG1lmlOglaYLsDp/rI0GA7BA6VF6EtLCzateGISU
	gTXdaYI2hW3T/jyAdgMsgDI4sehRmUuVKzIHXc58SW9C32rktDCWvL9BzWw==
X-Received: by 2002:a05:701b:2411:b0:164:3237:4485 with SMTP id a92af1059eb24-16a4e9af51fmr3953179c88.0.1791589630855;
        Fri, 09 Oct 2026 16:47:10 -0700 (PDT)
X-Received: by 2002:a05:701b:2411:b0:164:3237:4485 with SMTP id a92af1059eb24-16a4e9af51fmr3953150c88.0.1791589630122;
        Fri, 09 Oct 2026 16:47:10 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1dd57d0sm9142318c88.8.2026.10.09.16.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 16:47:09 -0700 (PDT)
Message-ID: <c03cff3e-b135-4125-9dd4-f9e342a02f8a@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:47:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: remove duplicated STA state
 from link peers
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260925051036.2838210-1-aishwarya.r@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260925051036.2838210-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA5NCBTYWx0ZWRfX1PLVbb1mXiDW
 T46U2gTAPcBiVtGAfgNEx/WUYeVHOv03nXI0qcLSZ/A9E/RYzaYG1PD7K1k/Qj4N4O1K4buYFjQ
 UoCyauAwYjb1CVmSnokOmU2IKdhhc7waipvVV35GcqZI/9lnGRXSyZws6RrOgI8T5QvOwQ89Frr
 Tod0PdatW/3RsDYsLGZNeuLJdf7voIF3bgHSJHg/SUlkgFpZJ3A7f4Q8HuXe1DUDYRk7KBFsonk
 CkRE4y67QaszoDRukSW34sgY/Yu4sYzJPPmjC4fzevP5hx+jUHa6BjP5ezHJuQ77ufrLENFVzoX
 RxZdAbikRg5QxzGKnsczWuHI+D6kgZJAdLx/mceaz0gbYE78kRRPS6RDUoT7nAJHVnqGHnwNiyC
 OUpuVZWvTdCZJ1ec4v3dDgUtswBsHravNK4ntatSNsa4Bes0mVcPG4YeFE1i670Cmns4yIZuz3F
 f1T0qjliDTmUX9kI6Ig==
X-Proofpoint-ORIG-GUID: 7sVdwDjVi87BkRsBN7IkzJN3kPrbvCrL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA5NCBTYWx0ZWRfX1+vElyoOfYqa
 Zu5TxZaKJCB/2LKCgtESyYU11U7j6KY+9P1HI8sacHL9mom2SCYvMBf+MagvFyxii3X+5S87Y8h
 TeF0OGgRz1JNgEZTJpMzJIRNHe5fXxU=
X-Authority-Analysis: v=2.4 cv=PaFqFShd c=1 sm=1 tr=0 ts=6ac97d00 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=kiikUzmmTVQhVswUDHEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 7sVdwDjVi87BkRsBN7IkzJN3kPrbvCrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_07,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_164713_672102_2EF151DE 
X-CRM114-Status: GOOD (  15.97  )
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

On 9/24/2026 10:10 PM, Aishwarya R wrote:
> ath12k_dp_link_peer currently carries state that is not inherently
> link-specific. Both the station pointer and authorization state are
> shared across the links belonging to the same logical peer or station,
> yet are stored separately in each link peer.
> 
> This series moves ownership of these fields to structures matching their
> actual scope:
> 
>   * Store the station pointer only in ath12k_dp_peer.
>   * Store authorization state only in ath12k_sta.
> 
> Doing so eliminates duplicated state, reduces bookkeeping required when
> the state changes, and makes the ownership model clearer.
> 
> Patch 1 removes the duplicate sta pointer from ath12k_dp_link_peer and
> updates users to retrieve it through ath12k_dp_peer.
> 
> Patch 2 moves is_authorized from ath12k_dp_link_peer to ath12k_sta and
> updates authorization handling accordingly.
> 
> ---
> Changes in v2:
> - Rebased the changes

In my v1 comment I said:
If the conflict resolution is trivial make sure to carry forward the
Reviewed-by tags.

You did not carry those forward, and did not indicate here why you didn't
carry them forward.

Please review:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

In particular:
Both Tested-by and Reviewed-by tags, once received on mailing list from tester
or reviewer, should be added by author to the applicable patches when sending
next versions. However if the patch has changed substantially in following
version, these tags might not be applicable anymore and thus should be
removed. Usually removal of someone’s Acked-by, Tested-by or Reviewed-by tags
should be mentioned in the patch changelog with an explanation (after the
‘---’ separator).

If the v1 Reviewed-by tags are still applicable, you can reply to the cover
letter and add them in the reply -- my tooling will then pick them up.

Otherwise reach out to the original reviewers and have them re-review the
changes.

/jeff

