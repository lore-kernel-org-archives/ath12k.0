Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC61E6BF3A
	for <ath12k@archiver.kernel.org>; Fri, 30 Jan 2026 20:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=; b=BNTjLUHxgu3dG0zRceyjAuNTlY
	iSN08zOhYVHLSPEfrxcIys8H6N7LItpe7Ag7aZK+XJtkejQ/XHxhRn5w5VGgtw1t2AEmQofR55Kwn
	eZtJzTquAWJmko92YX3TtEO/1Yj25xyk7/jAGheKmjbuDut6iNyPv+jG/OgJjZUOCSlb4AIJ18Sew
	ukQ0PZ5NQg6141SFMeXUOdDX7D6IWMK49/EUiXd8ANYBXAGEtznPCnH+F++sU1WXqTQ5ASUerXZp2
	kK16Q8RZrUdjhkYKdwO1xROwNH75s57Qp8NL3dgBdFtLTOphNxXi3/HFcudATYvWOz8DocBaJS8Jx
	twUWDBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlufy-00000001uRH-0l7O;
	Fri, 30 Jan 2026 20:01:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlufv-00000001uPS-2fJQ
	for ath12k@lists.infradead.org;
	Fri, 30 Jan 2026 20:01:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UImfPi751601
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 20:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=; b=bDrwHOQZYvNzAECP
	RAruACmted87t9FtA4Z3d82HJ2nKgE+X84dkK2fQNVyiSTsvrVRbVGQIbSqYzXLa
	z+7RSj3OJsdh/do/aiM6RMVh0BLcSKgHolYY2eK445CCx2jFHUl4ULb0KhmBiPRY
	BjhTZyuTbbEXgg0J5TsD8HoJw5uXml211zxyGSc6JZyZikicX2Wwd2MJZMbhaG04
	88EG1uIKUJ5jFVXRJkbOP8mIlk41YcEhjM294+Uu5Zsi9i4O8j1cuNTzBPsSLXT5
	eB/4LjIVM4FW4ukmmQGiH47B1iCtCrwRzQbxsp659Zt2P2AuNthFIgFG1iicOBp+
	x6SMlQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c128hg6pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 20:01:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11b94abc09dso3726184c88.1
        for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 12:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769803262; x=1770408062; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=;
        b=Pl8Fsz8Mnqs80yAeqsICjpZMYuw0YVjsI5MoC2nEkEYmPCIh64uuF4DCe3E7B7epVp
         C2Xw9I3g+grDIdRKu2Bmq9LZMbHxZ3m+ahmfAPyc+ryJa/jko8fuOX9IvUTNjoKRIdK+
         mxoWENl3XjFAjD/EWcouza+OZLHVS9N140MYZrurLxaQzs64PvWkYzzgc7bV4gFXflxr
         oT3SgLDjQSk/FRYhSMakWZYDtJ0HL4z15hi2yumpn5Cnk7cfB+DCZIVij/zpwSkUJmMw
         0/CJLzmZZdnYGpa843AQA/zE3Z4K+2+2KpSffYbEuExCy9Y+UwUwFR9yr1KQjb0pqLov
         ao/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769803262; x=1770408062;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=;
        b=pIjZ3mK3znnmRYf/U39pbl0JZAS6sZB8xTcg8IrtgC7f+42qaNS57jXysTxklks64V
         wuxYWoYefSdLvVKxU4Rpb+rf4c3l//p6N0wAf3CBOAWu1MR0G0IaCbDf2e0l6wgIsJxq
         jtmFM5QPN+k8GJ4DVF3uuLlz1o26PH4kS2GFVXeqJ+5ZDYEiTLfXWKP2MVCKk89b9JFI
         0X7q1ZiV1w3a4M6xAF6XVFkuHtFJDEZhShEQNJ5JY2QZkH+kQw9EWgKycqFXCKvxTajx
         CYO2Eb9MIFDUPSeAaGQOm5cAFJIWJd8Nacn0mss4d2k14IZYsP7QC3UXYkcGkCR9sOY1
         lKrA==
X-Forwarded-Encrypted: i=1; AJvYcCU686AlZVO/Y2Fuu0XkZZVkSDzcpftby4UIsw4bpr5yBbqpF2wQ7sdWqhYyEA0DQAzXy9PtzjE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZddNQ1t8cNkuA4Te/f+Thzi+RnNAgfcloqxmxUI6Cs0CsMn7D
	Ken3nxi6dnOPyZQu+rf0MrNI+jd6a9lzIFZ9MLBirJCcbDvfqLz+izsz66QUSIDnqjcf73mfcRd
	xa4a6IOJ0emKQJWg3yvWqU/8EF/Z56gLZ87Lwx6jdcn6feQJZ3QJRM5Oiz4sYDxVM
X-Gm-Gg: AZuq6aKppE7GTH1ludU46dxZ413GYF5ivVHDZvNNXV6OlxZqo/hIBQgG94BDLP+sTUt
	WpOKkfcP7jRmNEedjhTPLNAmj9SkBmvWMKLPZbWC9Nt1YC25ANcW6pElfbqJkcgSWzkc/eOj2NE
	TpVcCEM168WHnhumsrULGSu56wQlEe18gynC6Y8Zo6Zmu3UIKY5A5xml2ykRXHavpYhD0zQUpuW
	QyhSIKMUCR8YMOMdoOJnHLvDtfuNub/z9iiE+gmRfm7USWKkqTyxeUGM0F7Xjj4dcBbDFjzUWaF
	tbKaqO2m+nUQ6zZjLpKCIIQoBNXDNgIAtieaGuTVdZc0/0NRTvKWKQmnOL+0fa7GDinpDLgmSw1
	jWRmTN6ikVyQjW8j2FgswxxEW5DdByph9ZBLGG4VzV22BfI2topO9nMvFKabgFuCIbvZE9k1gZp
	K4
X-Received: by 2002:a05:7022:6082:b0:119:e56c:18b1 with SMTP id a92af1059eb24-125c1000e70mr1983163c88.25.1769803262319;
        Fri, 30 Jan 2026 12:01:02 -0800 (PST)
X-Received: by 2002:a05:7022:6082:b0:119:e56c:18b1 with SMTP id a92af1059eb24-125c1000e70mr1983143c88.25.1769803261707;
        Fri, 30 Jan 2026 12:01:01 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efb4casm11546699c88.16.2026.01.30.12.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 12:01:01 -0800 (PST)
Message-ID: <7a763739-8acb-4bc2-92e5-3ff8a3fa2bf6@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:00:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260127
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
 <usrawtmodalbj4b4i22tk3hzgbrpt3gdbji4x7vfzdhp6qsb3g@rw2bl7jdnp22>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <usrawtmodalbj4b4i22tk3hzgbrpt3gdbji4x7vfzdhp6qsb3g@rw2bl7jdnp22>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE2NCBTYWx0ZWRfX+li7QrZOBbeM
 +tONz2CGvy4yScTwtEesTI18eRD7+o47quUMmvhUpR7xjQNy3FLznpnEehx4kjvKgEsxPxkgc9Y
 XP5CR/i3oVn6VKY8noDg0wsCKOtXIpW7PhQ7eZuvK8SIfVTypsJc8wO9mpNrfhhx+Dg6gPtTcZJ
 3CA8t04LReak8OmJLJPIpqFuuh4AkJH2m20UiaAXRrkCYD/5W0T2s5KLmDerKFRfaXwwXYIh+0U
 809TWbZFrpLqKstfT5FNnk61zxbKFHALh4mxYD+7LMuCEL/7TKW5JiDezh5D14QLZsqjlgX27Yq
 k/+Ez9SqMlWp/ctm+4AMDj2NP+QQkEvW2soMPMThGmLgciM3G+I3Oo3VkcNevoVCcKCG64/ulEW
 +YSESTJJCHdHvkeRFeWzOzjPOzdg8+yOWDYi2qsMoMFV8aOL3QBjxWPTxh7eQyF9cBFlR+fJrxZ
 Ie+c1lf16m7tCX4wCAg==
X-Proofpoint-ORIG-GUID: RvMKrG-7NfEhaSk1NjjZTTFW5619kZov
X-Authority-Analysis: v=2.4 cv=YrMChoYX c=1 sm=1 tr=0 ts=697d0dff cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RcOUi4Ga9jvAjSuFGeUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: RvMKrG-7NfEhaSk1NjjZTTFW5619kZov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_120103_679674_27B54301 
X-CRM114-Status: GOOD (  12.26  )
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

On 1/27/2026 10:36 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 10:04:46AM -0800, Jeff Johnson wrote:
>> Hi,
>> Here's a new pull request for ath10k, ath11k and ath12k.
>>
>> No updates for ath10k.
>>
>> For ath11k update board files for QCA6698AQ/hw2.1 and WCN6855/hw2.0 to support:
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255
> 
> Don't we need the variant for this one? Otherwise it's too easy to clash
> with another unprogrammed board.
> 
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
>>
>> For ath12k update firmware for QCN9274/hw2.0.
>>
>> Please let me know if there are any problems.
>>
>> Thanks,
>> /jeff

Please drop this PR.

We've spun a new board file that addresses your concern and I will be issuing
a new PR.

/jeff

