Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E1FCA5FFC
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXVGuZtFOH8Mp5oPSiOEDvmQpYflZiDKAoRzGqIO4R4=; b=EvnTk3h7rQ4RaKq/1+vlH3RLSw
	8zW23BtSnIo7+AF5yV1vdotImvdHeuGU47i5QeV7KYI+fJ/OKErYMlDbWXdxvY7HU7aYM8oLNMWYN
	fSN/MiG+jSYydexzBX9azpktLpUJk69mFZsgotW8uNvf4z8ghLD/Ks3RGdnnyzrCAzZlr8x4JyCQo
	7jJuJFixAMdfW6YwM72Gdpa1UXKrIKTxXCR7mxTsMV+pmCOPe3rVayEF64mmd/PBOrEUac9FYrbuT
	bcjMRPXbQ0CLahSuGEwEGBHser96Ruk44rPmy1Gc26Uz+0XOfQZ8zjrTU92BqGbCUeJ8M1UzqdOm2
	4YnYOB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkEs-0000000Gimd-0r4R;
	Mon, 05 Oct 2026 15:04:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkEn-0000000Gilw-2PzF
	for ath12k@lists.infradead.org;
	Mon, 05 Oct 2026 15:04:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP12M1195708
	for <ath12k@lists.infradead.org>; Mon, 5 Oct 2026 15:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qXVGuZtFOH8Mp5oPSiOEDvmQpYflZiDKAoRzGqIO4R4=; b=gk1HZM7XybugdCpJ
	J0BOmRtb/fP2GoAxIPiccRbCqRGR6mJVAYxZbCWq/kEcaFTbuSECy1mt14JBLBq3
	AdxwgC88xDk9WeqQXHp8KAWF3b2QfBsMS2n+/WvNL+9b1Qd4Iw1u/0SSyDCYayd0
	rT88qBV5DvfD9mH4nlWebvLgSM02x4dggW946+Fibq3PGpLgrF32lCwKcS67iW28
	YTrcvBi0Qyxvz7nH7H8Ra389eW//fB5mlIy7pHP0cNsPtme6zCTtCKy1G3j+NgK4
	vbP+yOpFgFAjuzgF1ctISGKaT7PioG8ZJ17bphL/uBdkayVXjZLMOEoldN8t0NxJ
	PUBzUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfm9np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 15:04:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso33609965ad.2
        for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 08:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791212659; x=1791817459; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qXVGuZtFOH8Mp5oPSiOEDvmQpYflZiDKAoRzGqIO4R4=;
        b=d56GUiThgJuywofOeTH0B1X+D4JlVS6jq4Yoj5Alho0gFXQsULNxWyn815uilrsHsf
         Fkjxh5KjZweaieOLIZxJna5bNGZvNX1dB0jl2YmZcL2B8O/SCtrx5v9Ty/YRTVz1YKCX
         XKCTDjyXi1rizRXPWXecYoXT+Lwp3kQpZXjDOpaNTHH+/Pq6Brahg0PZJFs8/flRt8eT
         6KdBqFNZG1Uq1XWn6VSiWQN1wTgk45MRksXrdjHAtv31FpqHTYtTQ6d6dyLRje1ZEpqA
         liW2OzUh65GE16R6Nj8F0KHKon3ghdCprbuPR64ET8zvRsbz5G3la9yS3ntU5220zKFm
         cPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212659; x=1791817459;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qXVGuZtFOH8Mp5oPSiOEDvmQpYflZiDKAoRzGqIO4R4=;
        b=HRhRfo/bYnN+CIc+cOhFpnw4wuRI/m1Uab7vcPKf/VBFYPPckkdki3a2eH8HEuRZfs
         n16TmR1JAV9l10aAGYXpKM1PS2gdTx+NVkiSM4LFqMeabAgQG0sZo02VN+/9r1VOs1E3
         UESqlKJ/SHV42dQsdDfqkRhChXp9TlOwliUptlg6ZZa+77Mud5GiVyP0zKuyWLPrgg8a
         RaIie+X5e3xk1EiaILhcF1MlFGEHOL7P/OzdZgKQfA0wdakHR7N8DCyiNzFJRadEv7jp
         Q+OGIsn6MI6FUm+ssZYkbs1bKsNiuA5YDbQPwwfLKGJBPExDin3xwyqNV5CQCXPkJYiq
         ucqQ==
X-Gm-Message-State: AFq9FYJLSIIZvi4Dr3smxSB/7Yhlb9wUCyR6lyEsw1xAiaBBVE+l1T4T
	YNP6XtcQyGA49QH2pqDEG0vxH/qfQyPS3OmOPso0beNG8FifX+RN5/2NTsM2EjWy9WWdpFgAIze
	UlP+H7pLVsA2DakizikywbOhAQDmW+B6/B+NiLNWX9mMiKcSzMswbg36KZs5cFXpq
X-Gm-Gg: AYBFou3KAZmVpJV7mcr3hQcFK7D2PMG/IoIC+7+yeSPXSTeV4p9Sju3S8ry+xxo1FQx
	VznruQxEPBEGBKUxAQU4YcNI3pKOed4s9GQ1h/LHJRBw8ATXJw+0j2U28A6vwxkSt6m4VQKNrYb
	6aAuAdU7u3RKca3gysEpoBQYvkwcSpM2bDR0GZ7W7ITmq2g2FPxdROblSbGGnIz6WStTKwm/h5E
	sKKESVdPdaC/FghRzw8lOELZJgDaJNdsgiwe+3kPRt7x8xkOpSFT2CHKi1aJN1wi7aK59nCbRN+
	Q3+KZBUWsfAjzN6pYMef5pEZ1aPXsduhTSgL95zdJ3+PhFNCKgry3PlndasE8dO7NJm0z92e6in
	YKfqkRqtG4UMPoEUJJIWs4/mqwWDCo3r4nXqNm/8Gd/V42yRAcvmnuanFuA==
X-Received: by 2002:a17:903:947:b0:2e2:d77b:e587 with SMTP id d9443c01a7336-2e510523256mr76423355ad.18.1791212659394;
        Mon, 05 Oct 2026 08:04:19 -0700 (PDT)
X-Received: by 2002:a17:903:947:b0:2e2:d77b:e587 with SMTP id d9443c01a7336-2e510523256mr76422975ad.18.1791212658941;
        Mon, 05 Oct 2026 08:04:18 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ec7bf7sm9018055ad.45.2026.10.05.08.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 08:04:18 -0700 (PDT)
Message-ID: <9de3fe85-6a53-437d-b2b5-9a5ac83b9c95@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 08:04:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] Revert "wifi: ath12k: add panic handler"
To: Joonhoe Kim <26rote@gmail.com>,
        Yingying Tang <yingying.tang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        yintang@qti.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
References: <20260612032332.2278338-1-yingying.tang@oss.qualcomm.com>
 <20261004093456.74263-1-26rote@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261004093456.74263-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ebpUnFSE0GPKJvTlxNso4i-ooCot4jbz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1OCBTYWx0ZWRfX0ertoSjzdN/8
 aIPWbW+nZ1Ml/9RN3UYzOHs9A6CdwMKvzPKkfjkk3YEQ+38zSmurwfYTvATEW8CVgwy2nboQlz1
 deW1aJfT39DEiZa1YciBL3sAxYgv+9w=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac3bc74 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=eD00KxpnBtPYGZ8zRHUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ebpUnFSE0GPKJvTlxNso4i-ooCot4jbz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1OCBTYWx0ZWRfX/gx7e3qKHLTm
 KGu3JbyeGIWLQFEYOMMXAYl8QtHumL30jaTUi8jg9WOvjjpU4cf4pqUnt1T/sxxY/hi5hnvIA/9
 ao7UVakN8WizA0xnF8rlP0bMzm0LrRRwNMHp2iSV5ObuWmW2GsIfrIA1OVqZJaw1TSz3kd7F7Q7
 MQvqwRRrRTh8IYF3h0qaj9GqLVRJQGeMEBy/Y4E5cZkz99vCujmsaANxIkyte/mJtbC2tDLKky+
 S0fv5h2HGg60qWq/suz+wbNkqjXhbirM2WXscDbYLt8GoZAEtubQlov11QHoWvyaitgl9gC/hJ6
 QFTgfAB8lEmIjahL0ZZqaKiJFEYuh9ROIyyc4iCIULXWI/zcJUnjLJMM+P2NRBCU2/mmDI/oqF4
 Way9uJzBwzsyR9HeLxiQL97/JTMwaJ2rTBiDpOw1v8YceoY+XEksPtaEIoB6eVMickPbJZNFQCv
 c2M8xgKZxn44gg9Pbxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_080421_736085_D4218DA8 
X-CRM114-Status: GOOD (  12.16  )
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

On 10/4/2026 2:34 AM, Joonhoe Kim wrote:
> On Thu, Jun 11, 2026 at 08:23:32PM -0700, Yingying Tang wrote:
>> ath12k_core_panic_handler() is invoked via atomic_notifier_call_chain(),
>> which runs inside an RCU read-side critical section.
> 
> I hit this on a WCN7860 (hw2.0, PCI) in a Lenovo Legion Tab Y700 Gen 5
> (Kaanapali), v7.3-rc4 plus board patches. Here the panic never got past
> the notifier:
> 
>   SMP: stopping secondary CPUs
>   Voluntary context switch within RCU read-side critical section!
>    schedule_timeout
>    __mhi_device_get_sync
>    ath12k_wifi7_pci_bus_wake_up
>    ath12k_pci_read32
>    ath12k_pci_sw_reset
>    ath12k_pci_panic_handler
>    atomic_notifier_call_chain
>    vpanic
> 
> A hung_task panic stayed hung until a forced restart, and a sysrq crash
> only ended in a reset after about 50 s.
> 
> With the handler removed, a sysrq crash reboots normally, and after the
> reboot WCN7860 is enumerated again (PCIe Gen3 x2 link up) and Wi-Fi
> works.
> 
> Tested-by: Joonhoe Kim <26rote@gmail.com>
> 
> On Baochen's question, the handler came in with 809055628bce, so:
> Fixes: 809055628bce ("wifi: ath12k: add panic handler")

I'll pick this up and make the applicable cleanups.

/jeff

