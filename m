Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA60C531D0
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 05:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUXCyPbow4yUif1Oge6A2zcHD6lU8y6rMl8bk7t7NqE=; b=wMpOv61uyGDJFfJ7YGp8G7byf5
	kYpjI4Cy4L/Hoc2V1pUUdIyXDKX3KGAae9gPwvW08JOr0w3E0x5t8h9dcTHwt/AZ83huYHTH81sxa
	QjCrUDTFWLjq8/Rd5DlZ9DgVG1p3xqjicxi0MzkgJqMUgHestOmkWq2TMfV/iksO+SCUUniulyiBo
	AmWUcvAnYQOEpxXaVlro4o42OhvvozrWanjfS9B22xw3U2PUwlmsGQg7fir8cI409Td+5tJpXWqWB
	HbYs44fvjzvGjg9P3P8JABqa05aoDLT/kY2JyX2wSIMSUUkoO21B1i0FSx8APlduKbnlCzq5vjprh
	Ekl39TIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woDcn-00000001xKk-1u3r;
	Mon, 27 Jul 2026 05:11:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woDcl-00000001xKG-3EEm
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 05:11:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1g7nj2138874
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 05:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUXCyPbow4yUif1Oge6A2zcHD6lU8y6rMl8bk7t7NqE=; b=EAyH5QzaGI2fH9Ut
	Ph2NuUUAOuniSdcOx9XDSjaHG9CZygSCXWhA6LKC7tQwW0TRY0J6whesX4q3PIVB
	VQ/kNctBjfYv3SRoBvbFm/XQThkXLQtIZo+UwcFz5uHnea2QEr4jA0l6D+IZ/ZqK
	G/f2qhmzEtoqxK1PbadmjJvqRxLKashN3muMRxuP7RFnsJjr1YcR9Uq3D4z/j9Ey
	IrijZHbgYV16WWN5eu2eVhaZd+LMkZip9831/mMTwElV+ARDskvCwZwPAuyvrXGM
	458sKzHh7LDD9gZB0A+nMBbse3roDSdf6K4Izl0AcuxUXJwac3n406dosso1Kz8H
	BebRqw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7vj8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 05:11:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so1619721a12.1
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 22:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785129093; x=1785733893; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUXCyPbow4yUif1Oge6A2zcHD6lU8y6rMl8bk7t7NqE=;
        b=YSCLlOABpnIZyz10wrkO86363GuZ6s5p8CobtBNl8uyy6+5sYn3v7mjpctBi9yNoLy
         nu7DHtsn3aAgDnmUtQ/Ok+XxrTEwi0/l+aprSGec95CnYTKhuVfG0QOmgelz/WU2Woen
         J8zoFyVjiSrISXg1B38I1p/UrmToKS/Jp63cVFfQzVBARBTjMcDkags0EJ1C5RpLUKUw
         Sqxrg4oR6KV8sjqH8elPvm7GjAWtYznLWr7feEUSrcUwEfSfnw53mpag0m3HPdjl9iYG
         sMTBvg2G3EFWHzhIQ1THrbkQwbD26boN47QR4v9Mc71pi45nBWILUytrh6ypqxTsgfl+
         k1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785129093; x=1785733893;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUXCyPbow4yUif1Oge6A2zcHD6lU8y6rMl8bk7t7NqE=;
        b=XLESxwzNz9gWdITK4xR2RGn65bYmq8C8O+3SeNHmZk9gOTDbPi9cptpE3/lTYMs+lc
         IeohOAmPMTpE74rjC5oAX89kycyiSEr3lpryqocLJRUyfgIsg8vjyuRvZ+cS8cAqiiy/
         kp2ptLdXXVP5B22QLjhOBSokp15zKOejheFxiL/VT5Mj69hiLnTW0HcUNJNURY5rwYwo
         tsfFUizQXgu6u7GDc0NktNDXEIoXGDBFCNaJJmlYKqDFdhS7a/ZrfvFsrwtUyvQuc7y5
         cuwkTyt208N+9FruppR9O2jjEr2Ndu9ZbSVGrbtIB7ybCalRt+KNZbnR884Gepp+y5BQ
         6lUg==
X-Gm-Message-State: AOJu0YxHjwj1kO4es7bQsRBs1HQGPOK5oiCrtYH5b83eCqzo3c2e1MR+
	P55C2mMQNL8TAopqX5tOaK1LtzZJGbT4aYYzwUe4a5oVoRxPPFyxnwTsHITpjoZ0269xtUjKsRv
	lbHEAAtIse55As6IytPaERuS3h5CdZlfSXlnusDTdKBKYA58HkDpqpRWP3Uzd9UvZ
X-Gm-Gg: AR+sD116APwXxxN3q0FtSiOMS1UaDb16eTu3SMGpEfnSkX06j7ZKuuvy6yOscQmlUZs
	mh39MVZAMZNsiF53zz6WFYAjUJ9k+ZvwU7n0cye0JZzGMWfZjNWFhtQRi88l7lzXRBdxXKwfZc7
	YVoTPe088h2hxK0Ecty8CWMqV5qdXw3KwPImTrjBJcPXV5u1aQF3Ti+QQ674u69cy/B4LsPWQ6R
	QdaaUiIXbEQ3R+ulH50pHPgGS7jkhLsuXlV7pdJY8RWeJT+5ojUTH3OWhZk0OKCgvKx2KR9nf2y
	+/qsj0p07Xa1QTCt3KbP4LyfT6o1J5agVQNueoLGN9qjacBqnQ809B51L21JWjxD5tVTiq30lzK
	mUCg3MLpN1t6Uv02RMJaQuswkiGKqa+hTZP63YARg
X-Received: by 2002:a05:6a20:d52b:b0:3b5:489c:7bb5 with SMTP id adf61e73a8af0-3c67da7901cmr6999990637.28.1785129093014;
        Sun, 26 Jul 2026 22:11:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52b:b0:3b5:489c:7bb5 with SMTP id adf61e73a8af0-3c67da7901cmr6999969637.28.1785129092616;
        Sun, 26 Jul 2026 22:11:32 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm41470321eec.4.2026.07.26.22.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 22:11:32 -0700 (PDT)
Message-ID: <5e1c8d1a-ffc7-43ef-8285-c1c002a36e3e@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:41:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: validate TLV length in
 process_tpc_stats()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260726-ath12k_wmi_process_tpc_stats-len-check-v1-1-c4ba2f84d9c6@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726-ath12k_wmi_process_tpc_stats-len-check-v1-1-c4ba2f84d9c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ulPa4PrArT9eP9R6MFVsgLbLZ5OSf6pT
X-Proofpoint-GUID: ulPa4PrArT9eP9R6MFVsgLbLZ5OSf6pT
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a66e886 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XkCbJFFJNXZGceBJsBQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0OSBTYWx0ZWRfX52DK6YKqMYk1
 x2JYgSj3VJY8DrT37UM9m0p+U3SU8Qns/XbZy4hdCj8fHRp7ehZ1+4zdE4P6HOGv4wIuYums0OT
 kd0x1zebmY0aXtnro80lD0wxsBdBZ+sb0XpE3MRJsffO68YfnIZSQFVbcSoTJVJbIOgL6KlAHSN
 HiX8m4NqrSD6KkWgNCxvXe1RFm7MWVtNDclyHteX23JoXcgHGo0SvYgNqYqyrhsYlUGkL/97VrD
 SqyaWPs2rvCFue9IfXXwGBGSOYlWtRi9BJzMkc/P4Yd2mhrGN1Or8p1Fcavzp5IOeuLw+O9S4dJ
 rfiMphL8P7MOwXPwjdAv7sZTNoKNEpZcTIuVT7oRFS0bRFDsk2FpfSJpGYfEuUeYNkRE8erTjtJ
 LwslPCdCgM1v16cALzhk2foiE3vMjK7H/NdHGtOZ2en73UjS4gmOH+ltzPTNX13i9KHCD7i2e7Z
 wkjlvTOD34Tn8mBvo5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0OSBTYWx0ZWRfXw6cpJsOD2ti1
 2jUHTlxrwrMCNfEb/s5dZIOfAk01b+Kopb7E6hNSPBwx0d5guN04aET43wUkkK5Ne2iY2q5T4YB
 X0+MAlzpeXW9BD0wgEN+3W4g7hPqkbA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_221135_940959_83193D70 
X-CRM114-Status: GOOD (  10.37  )
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

On 7/27/2026 4:32 AM, Jeff Johnson wrote:
> The outer skb->len guard only confirms the SKB is large enough
> to hold the full fixed_param struct, but the TLV's own WMI_TLV_LEN
> field is never checked. Firmware advertising a TLV length shorter
> than sizeof(*fixed_param) causes reads of pdev_id and event_count
> beyond the declared TLV payload.
> 
> Add a check that the TLV length is at least sizeof(*fixed_param)
> before casting and dereferencing the pointer.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

