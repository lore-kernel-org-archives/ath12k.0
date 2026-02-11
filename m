Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73318ECD6E0
	for <ath12k@archiver.kernel.org>; Wed, 11 Feb 2026 19:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vErCvmmmW9UrSea05kC0aSzanX1bdBIHDS+Pbt9WrNc=; b=2LTOpQQ8R4Y60xbQTlunRLskzg
	3aEb0GNUnWfsuJtGVx0he+ogjFyh0KDBDurvaz4gUiitTK/G07c6CT8BSixIZSxEYatzWjdf81oIh
	5z0NtBLIQ2b3iw3LcGjBMhie3rt3rvJa0pJagK7D0J0NUa8Xj1b+Oha9B0SmH5MYvVhmDdsJbAum4
	C3SL7L160+Wvc+B0xvlC6jMfMZIFY/lSiy8wMJOlLfje2u5DWAQ/O/QeUaJUgr5fujCpzhlfkLYU/
	uFidZtFgtu3BZ4pwqt8dHvk7GieKJvzoEL/iE0ZdYerIOcjdJFDUUuazsB+He2hBubRivqVnuN+Dr
	EX1xHSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFyR-00000000z9y-0Q1F;
	Wed, 11 Feb 2026 19:34:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFyO-00000000z9V-0Xtw
	for ath12k@lists.infradead.org;
	Wed, 11 Feb 2026 19:34:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BIpNR72546901
	for <ath12k@lists.infradead.org>; Wed, 11 Feb 2026 19:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vErCvmmmW9UrSea05kC0aSzanX1bdBIHDS+Pbt9WrNc=; b=BIOVvLuY3UUOOgBa
	vnyX+1v0vgXhs6m0DjcrcsRExEeLmP2OUTlrtMkCcnEmLxeMmHvE+aHvspHLrLAp
	5CNa71KHM9SPISnjVXU8HPNUBSyoua5LfQk2Li1+Lcud5sC7ox0s3zC93bIXQZJH
	e+R9dXrpSGezl6jLmUqBvYrS7ioavk4UG874QfgBPVq/1HcSCRRIvQLjByeL+c+m
	Pj3H6ttQjvWvs3JKIdigXDpLfSI7CLuw7YZm08Z5fYTtwjGS9vvX8PV6ruZOMX8a
	CTbOECE7leZWScmFrSk3wIzig+TcYwudP2tqVmlExun4Utj0ZKrh3QOExWU3yMiV
	ylUf6Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8ydn04sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 11 Feb 2026 19:34:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1247bb4db53so3374849c88.1
        for <ath12k@lists.infradead.org>; Wed, 11 Feb 2026 11:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770838443; x=1771443243; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vErCvmmmW9UrSea05kC0aSzanX1bdBIHDS+Pbt9WrNc=;
        b=gmBiX6+/GJiFxgNfS2hgNoPZvI9x2gsjNXIB4J98xsJYIoENT6ETLvylL8d3YhXM9Z
         ZS3xjNsAITCSv9lrr5dSOx8UlJrefmb5C9tW28pxK40fBFd3x8FvToQYtKUQeTV7b1Cj
         ek8PN/QKA3Z4S2jw+2g1c9HaNTz4qRZ1oJ7TI4Apk8LejNeXrsQh/st9ZHlddSnQAaXE
         1Uw3pJIlMIk3krp7DN8Zfe+vNsIUxEJjcUpuwBStT++eVAM+pYALNkf3nhTK+HWpZmr5
         6goYuC0y7yodT3mks/Egdu7SILosNh2u6H033OCK1iAzDi8M+r1rXBFk3ld88bLPCRsV
         9fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770838443; x=1771443243;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vErCvmmmW9UrSea05kC0aSzanX1bdBIHDS+Pbt9WrNc=;
        b=vQw/I/Q2pnF5BMLQ2q/QHm176mKNxOg4uZbpc02Y7diSlTsZvOm50+2CK33RU+3oeN
         dsLjHxR9snJN90idq0AJ6Fbee7p1jXVoBnmbJWJKfoCYDk/KYpD4WSPR4PdnzBTsHuwn
         3RzRrKSMiOyQdtSyw0sJgnPaHsMxCbdOfrxMz0TkEFIJoIriUtQM+M/2LqevfvCOzE9L
         1xbV4tUi8972+zhS0S3AMxUjKIcSPhHtQVt8uzowZBrMOz3uSnU1m+RMPTi1MK2yDEwb
         nbSffbR4/zOHZXNBm9S13q/kFrvm/7reKA8WOHvQcBsvmTrDWgOgdwLIjYvmQ0Zi3jDP
         qw1w==
X-Gm-Message-State: AOJu0YynfNA55UUnpxu3zUkmG+DPI257JgkNOC8lzriCWNDISGFyCZJs
	bgrBmAX2Yv0eCoDlHdqHRa9ACCznO/iAAE2EM3JBggurjkXxW2e9yW90gbF7Y5e7q0+bZzWltBI
	paFrfBJBkvs8sgVjY8LtNRuHRdNx8I9eR41W7N3PU+wj7Y4eNbKmIR4JY88hMbDfN
X-Gm-Gg: AZuq6aKcMSXVTE1hcLYyZxeTXmB0O7QYCefOtoop2z+O6EqMBP0ivj6+EsuR1bFS/in
	qTwaI3chwC3x9wLbu9GdwXX1rCiLfbatB7Z9fqv/deoktscMJcwxVeQ1AyrzJ23CvkgU0mPfMFk
	I/8I1PJaUBaizvZqaODr07f0zP1ttvqTWkOgCyN/QGZLfVXCdq4mrLkIScdH6Ai9Ijfc9PE0BOB
	sCyyFs4D1mio97/2A8t3c6YFJ0uWNqzFdzSL1a4lfNAenMJNtOuA2sK81Uyduf3jK/YHHJ29rTv
	iKfSstfmJ/aBYZDYljsSK09sc8ZaVSpni8Ii7oYqwoGlPclBuv6MPkSKzcCYWOIhwQ6nAMg/i7O
	ieojGI6iBYwwKsKBi7dj8EHk5f19f8UPEpyKr4JqVtp60PltQAFBTCECbnLGWGfLb8a9zIlgbR9
	7yPabnYg==
X-Received: by 2002:a05:7022:2507:b0:11b:1966:8732 with SMTP id a92af1059eb24-1272f77df86mr128002c88.25.1770838442690;
        Wed, 11 Feb 2026 11:34:02 -0800 (PST)
X-Received: by 2002:a05:7022:2507:b0:11b:1966:8732 with SMTP id a92af1059eb24-1272f77df86mr127993c88.25.1770838442064;
        Wed, 11 Feb 2026 11:34:02 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a6e9966sm3057571c88.10.2026.02.11.11.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 11:34:01 -0800 (PST)
Message-ID: <cdf6bb67-7eb5-468a-b01c-22fe6ff05745@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 11:34:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k-firmware: WCN7850 hw2.0: update board-2.bin
To: Georg Gottleuber <ggo@tuxedocomputers.com>, linux-firmware@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Christoffer Sandberg <cs@tuxedocomputers.com>,
        Werner Sembach <wse@tuxedocomputers.com>
References: <59ed6306-28f8-478e-90fe-4a1b73ae3051@tuxedocomputers.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <59ed6306-28f8-478e-90fe-4a1b73ae3051@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NLHYOk6g c=1 sm=1 tr=0 ts=698cd9ab cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=S897yw-y8637oqSYNAMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=fsdK_YakeE02zTmptMdW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 6cBZQrhyMCozcHYUNqJJ23SLXksAP4T7
X-Proofpoint-ORIG-GUID: 6cBZQrhyMCozcHYUNqJJ23SLXksAP4T7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDE1MSBTYWx0ZWRfX+nQRQLCoznWb
 34lbYbBbMyHMEctmLxyie0BnhgLcx2OUgGOQPSU9wfZtTAvG8gCC/vaffkxUf1mXMNn4A9sfDU8
 FTgjUIHVXa0v7hdtfUA+BgexVXj65gRQLWW76NcBMFf4/HmZulTzooMMo/TjBx7FwvWBPLg7Zge
 XM4ds/ZnM6EataEtI1JsSDe3KLFFWWKe0kMzEgt156rJncIhL15kmtJAdTiMnNIy5ZvzBHiYVkv
 77CInFfPbfxUOgdxQV9+4gyD/a9rzA+YtaKkTy0hkrGGIw1HAibYTXk9l1l3dzxq3AD2DSrGQyg
 FJmmECNSsW+FUolBVaWbOdqbSbtoxPfWZHSxkGgwJDASQVy0lBmAoPSHLymcYF6Ym0VI38z8k3y
 RU1dJ8mL1jSJypcRj+3ATpq9ueKjegUAnAYyrjbXc72Xp5P3jJoDJfhe0olj8Pu4v1urVeUaZRf
 cIjkXEwsRcjxN+1pkjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_113404_209894_44ACB309 
X-CRM114-Status: GOOD (  14.20  )
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

On 3/27/2025 9:13 AM, Georg Gottleuber wrote:
> Hi,
> 
> here is a new version of the updates to board-2.bin for WCN7850 hw2.0.
> The content is identical. But this time according to the instructions.
> 
> * hardware description:
> 
>   - M.2 QCNCM865 WI-FI 7 BT Combo-Modul
>   - Qualcomm® FastConnect™ 7800 Mobile chipset
>   - PCI Vendor/Device ID: 17cb:1107
>   - PCI Subsystem: 1eac:8001
>   - radio is for 2.4 GHz, 5 GHz, 6 GHz
>   - Bluetooth
> 
> 
> * origin of the board file
> 
>   - extracted from board-2.bin from linux-firmware
>     ath12k/WCN7850/hw2.0/board-2.bin:
>     bus=pci,vendor=17cb,device=1107,subsystem-vendor=105b,subsystem-
>     device=e10d,qmi-chip-id=2,qmi-board-id=255.bin
> 
> 
> * ids to be used with the board file:
> 
>   - just add an additional board string for
> bus=pci,vendor=17cb,device=1107,subsystem-vendor=105b,subsystem-device=e10d,qmi-chip-id=2,qmi-board-id=255.bin
>     +
> bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255
>       sha256sum:
>       3ee7d3291e4121431b79adc28dc06f28f0cb12d415e79244061c9349a1328dec
> 
> 
> * attached is the already present file (out of board-2.bin)
> 
> 
> Tested with 2.4GHz, 5GHz and 6GHz (iperf3 -t30 --bidir)
> 
> Best regards,
> Georg
> 

Just want to document that this was handled by:
https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/commit/fd7ddeb46bb57736211092c426bf6cfb2e703281

With the associated linux-firmware pull request:
https://msgid.link/ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com


