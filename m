Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DF0C982FA
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 17:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=; b=Tf5P8keOfX79tHmLFeXiQrTMGa
	2qkvEDW5Ua13uMYSb8xmYJcbXCNPnZoyTQWUOSxvQ7JnXulN6Z5vgZaNNdkeuwUoX8ruX94gNi+Qv
	Ms0FBGvkuznOJkSVdCvY+lJz60lfMInk/+QtgNMoHTwjC4KElgNqX4xCelrkwxEzRH1MbKqrUCQPQ
	5IlrwhEDyLregQyQD/+kB1nFsX/J2p891TnTT39/5SNXxhMTIVWnMDjG+S2aQEAddKU9jZFIDZgzt
	qWzWudzyeAVcgBK7mcRJNk8+t6WBzDjDFXICLa0bk9q2OG8BLnk66tuF/2zo+smPxlY09QPc6ZNu4
	TlAL+A7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x944h-00000006ANO-1kH1;
	Tue, 22 Sep 2026 17:14:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x944f-00000006AMY-1Tjz
	for ath12k@bombadil.infradead.org;
	Tue, 22 Sep 2026 17:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=; b=Y7lZ1XF8/KWqDrOTlMpRuGICsh
	Mxrn93iUrJ1V/awl5O4ppwVF7EWDk8Rul0vZ+xmB+YbJUm3fsctoEoe213bICA/A0yxbRV1XOV/7c
	zf09MGRUjbmxQdYOzPkB4iIoEp69fKyOl349AmkENsP3NTvotbQ0pXpQp2sYr3OTqZx0wmYRB+UZH
	BMGNFNGFKggcIBCpsuCka/wzAdvnFfdWObFDc+fqSIHnMfeOlHWv8epDva75fOQJp0o0iLTRklGl0
	15NQz2A4wf+1W91H7iY0/v5KqL/NJ+vkZUtnes4QkYdBX0oqduWsMY3qTRHhAw6SpkRw070Y9fUsA
	t95PHDGQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x944b-0000000DrFK-46fb
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 17:14:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEivMe3924396
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 17:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=; b=SH+LZHyYwm2EFfev
	dC5BCRUX03669BE8eC0oX2/hVQM7GGQdKVUNUdu4Itf5aHF9qQvWOX7MmQOwrZGg
	kWcnsZWveGgyMRCrEn2H8nN6mhJLWFQPRtULJLFNTYv1cSWibtySAPnLuuDosrK2
	WuJsH+sc9vYBtwbhj9SZDjxSCF4nMV1MYxKEGmRGckPPpNkjIjpzDsALZHYkyV4A
	Wi0miG0scxa/iKB0GevgxH2N8lUg9+pVqEZ1MI+zPx9gUdwdAbwL2ZWWDOoCZ8u8
	/779x+jpuN2xDyu7BTMFi1aVqBky7lF6RSzfZ/PAHroxEQ2nZzWlv/2Sj++WFsJf
	6Sha7g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec0vg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 17:14:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7961a79fcd8so9179137.3
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 10:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790097264; x=1790702064; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=;
        b=B0rwpkqhA1hz0jiFchKRyyvLn5BLjz3P37jnaaU6Bcv26JxIXtEbRRhPei4jii+gsF
         OIBPDqIDKJuOzop25GP7AmTP3p2b8E9iBXpDm3JZaj3KPwJeo6rGDbP+bcTVfJunTC4x
         jaiHDkyOpIGT88MdTqqQs3Q0rrNFodGyFB8YGI8SrVxSZW4VrWswrhIc2+Xx3AdkJthW
         DXgrB9i0khheSfRdRmSxZq5cpW+vQ7rOzAc8zMDBXvwu5uA6oE9MUwFDQLeIbE+EtvC3
         O3MZtInh0xsjxshRzcodxJNN0Gi4NGI3U+Y6ldN7QLem9q6aYA5U0YGl6W6ZB2VYyq9c
         dvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097264; x=1790702064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=;
        b=QKGxl6gpvwIWKaSire22GtTNXMtqMuj/Zmg+TIzPuEQ47plPaTgKLQW7bs4FEmJ54O
         0bpjSwpYpb8qk4ac1F90+v8r6UVGxmys85cUCH+/O+o5QvSLR0LjIZiSaJ88npdUW2+E
         hQ32V9YYdoNZrKv/L1VWit89svX7PPJfdVDfBcG2MI0Gl2Nnz3G51yTO/EXaEliPBxbA
         7qa5T03uv85NrmAvtTpoU8VKYKilCL7YP7aaKxPyk1+fHaoKawhMeqnbtWrXTuGbWsHf
         zNAE9Nfbn/zjMrkXD6NdUuXiHsQa0TdXrRICpvaq/vHE4kXmJdGlOFGKUP9FjDhSdzpc
         DuMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy28Nw4OdGFaUjPox+JyPIn9yZAZrR78pqoL6x4tvIuMhc6eBxSWH3jnxUY/BV7JQEB1mSYk28=@lists.infradead.org
X-Gm-Message-State: AFuF++l27BGfyJWzSSKIUafZLAAQlaCfTViS7Nba225wediSatECVS0O
	c05q8F585PSdmGD/XpjvjGTTJL3oYXJCjK3E/9PjgqC3bOazg3EtddNJKISVTlIq7rIASVNH/CS
	bxYD00dAKsXuXZcDOSIbTrrCXiZBawX3npXZbrhMuMMscxSxXMPVleC1jyU+OHkHO
X-Gm-Gg: AYBFou2Xce3TAVOppcEGEGIZrEC7fFNS6c6H+p8QoUwrQeb2bJ6m6lg9qWeknyUMZHL
	s7RWFH3DHJb6k/mJ1djTmuGzN+wxydJbCEcRPAJ8/VR68bxXVl31LLvqdS20YHSngT04UMI6bF5
	bhQ3KNidpKgcnvuckDNfATCTcQXGk4Ywr+Fx7JzSoBxULo+qfckgwiSf2BEwZhBzUKlTqe1rMyl
	7/CkMR+1Uc7fYejaT+0DslIeBKkaU+C2AvHYFIYtOGBxLkPzTTOwaCu454xOWM+ixC4KjAjmapJ
	5jLZjyIULxPDpr1j2aVy+Zj71IiBse7Jn6Ag5hcZNRKBLuIiG1myuQCoVe0pA5xZsNtI53+BXT8
	rpgFbyUENw4a+JVDhCFwIJvdtO0+UQLLNGMwOoKE=
X-Received: by 2002:a05:6102:f85:b0:7a7:19aa:f0d1 with SMTP id ada2fe7eead31-7a719aaf773mr6957661137.30.1790097264197;
        Tue, 22 Sep 2026 10:14:24 -0700 (PDT)
X-Received: by 2002:a05:6102:f85:b0:7a7:19aa:f0d1 with SMTP id ada2fe7eead31-7a719aaf773mr6957615137.30.1790097263755;
        Tue, 22 Sep 2026 10:14:23 -0700 (PDT)
Received: from [10.243.142.186] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf0074sm59131665e9.3.2026.09.22.10.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:14:23 -0700 (PDT)
Message-ID: <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
Content-Language: en-US
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI1MiBTYWx0ZWRfX8os9wwzYaAP/
 Y5WatLM7x2107UW08rs+5QMJpVAnMJwRnBEjP7SUdom+w0WH1ikCo3J1u2ubYSfHMGewQs4Q/OU
 wqMGzvVKstYDQTybtdRTPWOOx5Pto4nLipBtUixt5DsKWcvK/bejO7y0dQlBDmXogMT7mJs/nFK
 kDvM9GKiZ/cOgGomYkx4BvgTJRVfRv4V9LxqlaZCZWBzgOg9SyeQUrNj68hdlgoLizlvSDgr6Qs
 rEBfmdGQXTuQLJF6VFZEwGivZzvodDOZcUiJT8u5M7MJoKvtk+NOLMWKbLZ08BqkiNlyHos9GyL
 42w8xcTpteXu9PTw3Dd9S5yr31ioq+Z+7ZIweleQe6Ay9oKTpLwAhMgJO+PWFYpQnu+35m+F1Cw
 lDmhmIDPFUjyFKOLQyOoizb8Od2T4bUX8R/Ln4MEjE+UHWxCn/ET2eV8YD2luxLHbWPQshqzlAv
 PWkQqh0V8yyEA8zp7Zg==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2b771 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ar2LfINMGabpzH7QhtgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: hTeREHgGBuRLBoHE_JvyNwfuOnFym7Ha
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI1MiBTYWx0ZWRfX64INzmgoaIyK
 SjG5S1fdUzqY32ef1RQjt3swSZ0XKPJHHhnI8BKP9wuux7xa6GBxrX9rcJuVjCZHC7899u58bVl
 Ejwo82h9JZ8GYjLuvl2srtCQGvqca9Q=
X-Proofpoint-ORIG-GUID: hTeREHgGBuRLBoHE_JvyNwfuOnFym7Ha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_181430_706263_5DCD9613 
X-CRM114-Status: GOOD (  10.67  )
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



On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> +
> +/* The offset is chosen carefully to not collide with the node ids allocated by
> + * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
This assumption does not hold up for QRTR V1 headers where the node ids are 32bit.
QAIC devices use BHI_SERIALNUM as the node ID, and it is definitely larger than
0xFFFF.> + */
> +#define QRTR_NODE_HOST_BASE 0x10000u
>
Thanks,
Youssef

