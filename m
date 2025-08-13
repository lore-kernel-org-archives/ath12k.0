Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D45CA0EDC
	for <ath12k@archiver.kernel.org>; Wed, 13 Aug 2025 03:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sllljOc1ljNLdOQPpZWR1FwzW1viCVC1FoGGN0aVrZg=; b=RDsdEQB4mBef0LgZunQotPatyk
	Wm8klZiOfNIPOBh0j7TGBoQoAZahPBf1w8guc1/w/qHNduNxDBT+9VzLtBsV7SnCUqAcr22mMLr9Q
	1/ifHiYxroYKoyLmOwSlrBIjJ9BMHHK31Jj10Ta3Fq7V30q99yp/2DeOleDO01zi7yF983cG3vBP1
	3atcbWRLc/LOCxat5L5M896nFBLcc7LIjBO6v7bYcOx/P3kPEVLldA/o6Zn9xZzR8PRExB2nxf2Sp
	0zFrtROQgxZdv59W1ZgmfkVhW47lbxaweGUIWpOaAcdFJC8qqyY869mWYC3lOF1gJBy3kkUOixlab
	3PlC35ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1vs-0000000CUle-2Snc;
	Wed, 13 Aug 2025 03:13:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1vq-0000000CUkN-0CkN
	for ath12k@lists.infradead.org;
	Wed, 13 Aug 2025 03:13:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLgU80006035
	for <ath12k@lists.infradead.org>; Wed, 13 Aug 2025 03:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sllljOc1ljNLdOQPpZWR1FwzW1viCVC1FoGGN0aVrZg=; b=Jai0GnZLkFYgSSBz
	kF0k1Hb50NEHWANTUFfASxckbLu8YqSxbu6dALM2w/orS3/IIP/r+tEpg0QEcpMI
	ffXONLL/cVnQ8V5RBUfeHi64y4km4/vXdnhbaz8tEnDfxpfpZapNd9GKZE7hXPhe
	X8wVRgatvee0Lzlg0o9jTpWxjZk7g2fy+bIqYT8IyoKrjC6idQniKRCWQHJQ7buv
	KMO3QhI/O6MPZHk3fDRYCWl2h7xGiWsj5aFAIb8gE8KteZ772X4TOkNBMsa+SuEk
	GpEFwEG20JjggFThhCjXpOlINtN5fYBK2Tj890GLCAizhFJykudyDmmUPOSMRGlZ
	XaX2aA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjp2qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 13 Aug 2025 03:13:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2424aaa9840so67002205ad.1
        for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 20:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755054819; x=1755659619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sllljOc1ljNLdOQPpZWR1FwzW1viCVC1FoGGN0aVrZg=;
        b=hUb1zS/FI2zL7GQGEI543OIAiSOnVCTnrhpDViOypsY5I8JYZhAD3twM6ivoYElEr7
         1xlblK/psLfB4cj+DRG/DA+StRp8vXuzX2hcyBwssZa1+1dvmb4c43qkvLpDhqpy4umj
         JEf5gXStZKLu0BtmgLPbOyEfEuFMYCXAHW9qet+SQ4xb1JUdt7rD0zKVEz4W4tBaiSJF
         8XAi8NTbhXYrMd0CKYeXaszE6RwuiU/GPS7gRRJBoeQFpmf4NEAGQuIcAknmcMis80ye
         JKyTGKtpV/YLM3aJFaX1XQlrke9ThbJlqtjiTyezNiUam/KWZwRpjL56clhZtJiq/cOV
         cn6A==
X-Forwarded-Encrypted: i=1; AJvYcCVj+ZIjnYW2k3WOVytVZqRH2ft74qv7Y2GpQNC2q7HMj2ibeT9IQWNslev1j4wn/KSsiTGXS/0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5nmIrNP9uGmlymUf7CdOxH//K+Mbl5MX4IpbxZEUGLC2zmbFI
	Az0Kx6OlHI0knbmTixE9PFQDSTNzjCQlF6K8GOEwszVGsQ4v+1GSeQPE0tsBP7TjhjC2JNxY5iM
	pzVh16mdiuSOilgT42u3MbLUSQVcsEMRjjCvp9A79uD5Bb/S6/IXbuky+2g7w0Zvh
X-Gm-Gg: ASbGncuGfpleaYyebiSawOQWVf27Ei8VI34eVqRdSD+T6Js7Ke2M9lyKkWJKHdN3Xpt
	hDofDWRWjPQwNlwCQC71L3VY+Iv5peGVa/nul4c97Wpmq4JfJAInDkH6PsL5dWPbVmdYa/RaHaM
	eyvLDgPt9W+12hx5/zNEbG7Vs7oYLCux6tlAlV7VYrAKpNkdK2KMyjbVjZfuSGuO6v5byDfqvm+
	CwgWgd/vj2ueU9JMa4pV1qBEsowaDoFAt71P7BPcBfFUtJ6EXfJ+9Mlg2UXZjJLFmnmg1Fpc69Q
	q2ws6MY9oZ8KvMDQc+MPEeadbusR9p8Cg1NRVduXOjhlCft+mFYqpFTPyiXi63yDYlo8CcLFB4+
	45MwfSYu6GUCl0z+olORN8oJXpWipt/U=
X-Received: by 2002:a17:902:ce84:b0:242:2cad:2f8 with SMTP id d9443c01a7336-2430d10c610mr23199955ad.22.1755054819066;
        Tue, 12 Aug 2025 20:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE48ID7oB0DuUh0zxWdAtyfFe/BB9okuFdm9Hbecr68kLS/gpnnB9K35MQrvsaWGRvKFLrsLQ==
X-Received: by 2002:a17:902:ce84:b0:242:2cad:2f8 with SMTP id d9443c01a7336-2430d10c610mr23199585ad.22.1755054818502;
        Tue, 12 Aug 2025 20:13:38 -0700 (PDT)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aa404dsm311819545ad.148.2025.08.12.20.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 20:13:38 -0700 (PDT)
Message-ID: <3ae5fcec-bfa4-4d41-8ee6-2c26ce0e4f51@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 11:13:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Enabling 6 GHz band in WCN785x
To: Petros Christopoulos <petros.christopoulos@gmail.com>,
        ath12k@lists.infradead.org
References: <6492c438-7cff-400a-80f2-cf17e298569f@gmail.com>
 <7d934313-6062-4165-b001-853b1a66e2bc@oss.qualcomm.com>
 <b5ba0e58-92e7-456f-96bf-f5921df2ae21@gmail.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <b5ba0e58-92e7-456f-96bf-f5921df2ae21@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX546eoGonnuiv
 P9TMVUokIf1ntpUODNnXlN8FqPNynMZTV3aTo8CJQLQ4oyj7kt/AwP9f5WPffYtR9iYCUdkiuEA
 nUzJVYfXGqS24Hbx0TTA+mt6ashjf4HPsaTliWQHJA77gbziDHCVzJDDGwWbmiSi4LK+Gv2g9VB
 ir3PF3wE0ecpLNANpB+B1zbW8bMRc0Tai4Mn01OkPwdZM/vUM6NlwuucBap5vrYOOH58yUuM8Js
 dwxZ9NJDfn1EAwm8Si6lzqXywPu30bMp7UuioFsV6G9mAtErZOJ0VqhLhXctmqXITr0bcm7E0H8
 NFVGk7KlGDlrsXri+zzk4ze2zmvBRkkzUpWzBauMIcZwMOSZCiFHd6lG5fJsSnbJpsbUUA+kiOz
 VeLT6KpB
X-Proofpoint-GUID: KMWdjZu49MKGRbGrfKxtJKTJqwz7wqLM
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689c02e4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=guFGt37yKE0mxoUemLIA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=z2U-W3hJrleVIN9YIjzO:22 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KMWdjZu49MKGRbGrfKxtJKTJqwz7wqLM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_201342_214052_C108CFCB 
X-CRM114-Status: GOOD (  28.34  )
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



On 8/13/2025 6:22 AM, Petros Christopoulos wrote:
> Dear Baochen,
> 
> I tried the kernel 6.16.0 today (kernel-6.16.0-200.fc42.x86_64.rpm; it is Fedora kernel
> test week now) which contains the commit dcfebfd4c8dc0bec9b6649104cecc09f5978c4cb 
> (=revision v6.16-rc1~132^2~157^2~16^2~62)
> 
> but the behavior regarding the Wifi module WCN785x has not changed:
> 
> despite  sudo iw reg set DE,
> phy#0 remains self managed (see below at the end)
> 
> However, the option CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS is not enabled in the Fedora
> kernel, and I have asked the maintainers if this could be enabled (everything is of course
> simpler if I do not have to recompile every kernel myself, https://bugzilla.redhat.com/
> show_bug.cgi?id=2387486)
> 
> I noticed this option is relevant inside the ath12k code, e.g.
> 
> $ grep -r CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS drivers/net/wireless/ath/ath12k/
> drivers/net/wireless/ath/ath12k/reg.c:  if (!
> IS_ENABLED(CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS)) {
> 
> Could you please let me know:
> 
> 1. whether having this option enebled in the kernel is absolutely necessary for the
> ability to change the region or there are also alternatives?

The option is only necessary if you want to manually set the country code. Normally the
driver/firmware should be able to detect automatically the country from AP's frames using
11D feature.

11D feature takes some time to detect country info, so please wait, say at least 1 minute,
before you make conclusion. If still fail, please help collect verbose ath12k log with

	modprobe ath12k debug_mask=0xffffffff

> 
> 2. whether if this option is enabled with kernel 6.16.0 (with the commit above), I should
> be able to change the region of the WCN785x module with a simple sudo iw reg set DE, or
> whether still another special method will be necessary?
Enabling CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS will let you be able to set country code
using iw. There is no alternative for this purpose.

> 
> Thank you very much and kind regards
> 
> Petros
> 
> 
> global
> country DE: DFS-ETSI
>         (2400 - 2483 @ 40), (N/A, 20), (N/A)
>         (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>         (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>         (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
>         (5725 - 5875 @ 80), (N/A, 13), (N/A)
>         (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
>         (57000 - 66000 @ 2160), (N/A, 40), (N/A)
> 
> phy#0 (self-managed)
> country 00: DFS-UNSET
>         (2402 - 2472 @ 40), (N/A, 20), (N/A)
>         (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
>         (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>         (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>         (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> 
> 
> 
> 
> 
> 
> 
> On 12.08.2025 05:21, Baochen Qiang wrote:
>>
>> On 8/10/2025 9:56 PM, Petros Christopoulos wrote:
>>> Dear all, I have a Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.11be) 320MHz 2x2
>>> [FastConnect 7800] [17cb:1107] (rev 01) Wifi controller
>>> with Fedora 42 KDE, latest kernel 6.15.9-201.fc42.x86_64 and recent firmware 0x1108811c
>>> fw_build_timestamp 2025-05-17 00:21 fw_build_id
>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SI
>>> LICONZ-3
>>>
>>> The 6 GHz band is disabled, I suspect that the problem is the 00 region setting in phy#1,
>>> however as this is "self-managed" I have not managed to change this (iw reg set or an /
>>> etc/modprobe.d/ath12k.conf file with "options ath12k country=DE" have no effects).
>> Try with CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS enabled.
>>
>>> $ iw reg get
>>> global
>>> country DE: DFS-ETSI
>>> (2400 - 2483 @ 40), (N/A, 20), (N/A)
>>> (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>>> (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>>> (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
>>> (5725 - 5875 @ 80), (N/A, 13), (N/A)
>>> (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
>>> (57000 - 66000 @ 2160), (N/A, 40), (N/A)
>>>
>>> phy#1 (self-managed)
>>> country 00: DFS-UNSET
>>> (2402 - 2472 @ 40), (N/A, 20), (N/A)
>>> (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
>>> (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>> (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>> (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>
>>> I have searched extensively the web, found some relevant articles (e.g. https://
>>> patchwork.kernel.org/project/linux-wireless/patch/20250401020840.357-5-
>>> quic_kangyang@quicinc.com/, which should be integrated into 6.15.9 if I understand
>>> correctly), but still no solution.
>> Do you mean with the whole 11D support series merged the issue is still seen?
>>
>>> I would be grateful for some help.
>>>
>>> Thank you very much.
>>>
>>>
>>
>>


