Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA92606A31A
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 17:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w7WsuxFW;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e9yYA3fe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X0NWPj4s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=; b=w7WsuxFWY17b/Z
	YqiNC9ONKlVZooYIIoUfb62hbpT79Jv9PIzJ/KnF5P6fFn73YCaUMU8YPbTJknSHEOSC9uhrLQCud
	bOIgCFVuepKWMTDDqUW/axToEI7Wea3mZHhNSJNZL0Uiss6KHjhN+JdhODqXJuhBi+qQuwvM8DH17
	KbHSoB/Zw9mGHkCCL1jIIGF/fG+jVb2j1/w6aicRXv5PYWUE5laDkzCKtggnLaslpbMK6Y535b1Mc
	nGEb3DvSrn1b6aijmhqHNc0/8kSWti3STDtg3GbrsMW0iSTywez3xKKMBNE8C+NrpZRt6VhS0VVTl
	hps8e0z/XBR0ETC8lrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwwv-0000000EePd-0jQg;
	Thu, 22 Oct 2026 17:51:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwwr-0000000EeN1-37T6
	for ath12k@lists.infradead.org;
	Thu, 22 Oct 2026 17:51:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFDxg978814
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 17:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=; b=e9yYA3fe62mQ9SMv
	109TOAt2CaqagWfmRDafkPSXpaLh2XDwuoUibLZdVQ+DkDKoA1SYJQ5FvdOg4/jc
	gNHJjKENO9niTiRXo/efRTzbItq5KivpAQ4eKkB3K7ZxdyanwGu0ZQ42oL1aVsF/
	ridKCBUZJUuvqnJ1kUi1L189hdgBXjLMCGtQTL+lXaWtGG2NhhFAHdOgivosBhST
	zXVuH8C/Ia1bkr8c/nZsQMxKZYVSrlyq8864YuO3m4bcM6tAEic+X9Kyn1rO2qo5
	0GPeztI6ElRoJAbhsbVcuvGD1gEuO//YA4Kl5a0NyYwlzTuShRKpu7r3EATaAdLV
	U/x1IA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93dct4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 17:51:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso45470c88.0
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 10:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792691488; x=1793296288; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=;
        b=X0NWPj4sPs8f1Nr9i1O1k1Q8jS/KY8ScU3tdluyXgme+Mpu8sJMqyBMoEKFFgV+kO6
         CFNcx9Xnl6Gc6+K+YhyWH3SmT/NnzQOn1hiAoVZUvoT8YOyheBeswR6YGwhIYW2Wr7If
         MYfXtF5yZo8y1quSNcZxUIV8fUVgttZl5Gj6QPEwJ5458194NXy39hkrQOpdE1VVY7YZ
         wVrzEfEGnWyTbTnTCYprDP6sPwi72He3wtcJr6+V2ZR9R7Zr/5B5cyN/MB/HMG0YYKOJ
         rN6mBhiLyXJumMr7fPfvLRP73F+QaAfxMYc0t7pcqzRAIVzsURZ5itpyFTPK/D2t0vOn
         j9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691488; x=1793296288;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=;
        b=VPBTmbGEHeeq4IYJW+mGyuSoyp4EPCUBSQwVzzhXUUjAsua0jQ/T+0EMr9lvFpYYUL
         j3wXea9FhUMY1+xlVtkhEjIS00yEOxZKahOIXGGPDHl4MXehR0NChh8+N4M94HjTrAPt
         D2blYPezZzcq+h28kCFsa3WFiGHcztRvMlaBDO9XMr2okzo6d4OJ7aIOVMipyuMb5aDP
         H8nMmOGofVgRv8C9SaNau70MYXczVttVTw0E9R2wHNfq5CvU6dRFqIvKp2KJzEThMxNX
         GGjPtOqfrMgIsQ0qf7ZMYNgnaIwi1HKLCgicIJBQ3ixM2JNQTSOCEqqVRqzYRqaBZVlu
         eJIw==
X-Forwarded-Encrypted: i=1; AKwUvBxD9+W6/pqc2OmRnZifLIGC32NqMu9iGTAlkPNDfZo0jwxc6jynZtxgUWUqRx0N+hIuAptWOSk=@lists.infradead.org
X-Gm-Message-State: AFq9FYKpgOPkqe3Zu1xNlFKgVHrSbz+JjsEhdLLTe2HCQxAngaBVzjTF
	VF//cNwB+OxavtXAnmNiumVyvWgeSkF6tqLB8ogAfMJJ2PWBeccavOELlDiuUBTRBh0T7Lii4j+
	SVKTs+w4WmNYmSnyhbzKhCBaEOSt3excK2kqbwJFKO0RZB0WYbFVtFDK9FJ7G8e6y
X-Gm-Gg: AYBFou2xgHSq+Ftq239RwMNXb3sXkIeF8hLtc0tVn/2Xpo12ew965KnAa+hKnUY/fXM
	KeCQlG8VmQYRjytJmSQEvhyWVFpPUQij1F/6OfdWuKLvbk5ORfRZfe2KiBL6Zx6nLUv7JkxMavH
	IwyGvbL7A8WlJKL0C57cW/AktxOEkWlVr7tI94TMJGyCgIXJk5bF+UQdrw+JeyyD2+4RLnMBra/
	KblXrdLD8sVBKt9jFqGG8f8+t5jZrdI7g+DwVMI/K2aUI94WLOfcF8Qm85uHboqn0h2u5XAE0yy
	AGFwrWJ8ZvIVwcoDpfERTJT9FGXCScOa+NTpDC7rsxbGOmWQxNKOSbCFXTyfRNzNo82Rc8Vtqlw
	mIbA1CXETsxwEq6FY4FxyxOOnT17TiUbSN7NcxiTGzFY1GxHLOsJGxyCbew==
X-Received: by 2002:a05:7023:a81:b0:168:3243:c911 with SMTP id a92af1059eb24-195a0effa19mr244283c88.37.1792691488402;
        Thu, 22 Oct 2026 10:51:28 -0700 (PDT)
X-Received: by 2002:a05:7023:a81:b0:168:3243:c911 with SMTP id a92af1059eb24-195a0effa19mr243809c88.37.1792691481288;
        Thu, 22 Oct 2026 10:51:21 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195aa59ab33sm140790c88.19.2026.10.22.10.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:51:20 -0700 (PDT)
Message-ID: <db682798-07c2-467f-809b-693615b9dcb8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:51:18 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261021
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
 <tnbl77vafrjvgfyryd4zfyr2o5myg3vg744zglzitnpxpt2uoh@wejrgjjcbfzi>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tnbl77vafrjvgfyryd4zfyr2o5myg3vg744zglzitnpxpt2uoh@wejrgjjcbfzi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfX9KwkfGU3s/Xe
 FreHlxgHKGNyQgaA8EG+5MI8hC5mtP/J/fJnz+FnC/SIJUt0yLLsBywS2FksRQiRKNQk9mNwgwT
 Th9z/E2fjDONfk4j6shJ3J+C+jnyGdQ=
X-Proofpoint-ORIG-GUID: FASZS6BG2UDyrATTwtUtQRyhHpElMxpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfX+GvUSvdBDJ8p
 hBMwwtLai7xG3YCTHOZFd+Jk8dZDIB4wG5cG8snz1405HAJPU/EcrAP6c4eEw8wsYu4qo8I08bi
 /A9ylv4Y1cwyythsvOlDoGrYnPVCL3cy+O9ibejnAgzSu2kqLedU6EaNtadzWi1HEbXXM2+QbYw
 UiUtp7hUIrrYu8rZ8zJFIKSQ+qekXGuTkGh+OtkJ10eIiy8Bjb9hXiMzTqwAWqmMisYMvUOMFeN
 xcy4qZqSwLx7G5Zk0+kgVd2shSFh1yEObS23skEzb4+/QA7XPGKtppndylUFJOxQ4XyzOuzTGKS
 OviXHOHrwQuKN89a2T2/XLh2Q5ej7kpgxQ7GDhTjv0KeJTq//oMAh4xkiphQI3KMF59ND98U+Q3
 vsimCbVF6DXqNpzZTYgh1rPCi5kzouggilah9Ra/i1FvpWd7g+ADeEIQrFaWGWIOJDRq7yTeCv0
 YsddF+fYXOi2j7Muusg==
X-Proofpoint-GUID: FASZS6BG2UDyrATTwtUtQRyhHpElMxpL
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ada4d21 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8cXpSGzgMJdWOUynBhUA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_105129_804824_F0257933 
X-CRM114-Status: GOOD (  10.63  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/2026 9:49 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 21, 2026 at 09:30:17AM -0700, Jeff Johnson wrote:
>> Hi,
>> Here's a new pull request for ath10k, ath11k and ath12k firmware.
>>
>> There are no changes for ath11k or ath12k.
>>
>> For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.
>>
>> Please let me know if there are any problems.
> 
> "make check" failed:
> 
> 1. Missing "Signed-off-by: author information"
ACK, please drop. Updated PR issued.

/jeff

