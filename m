Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B34CC3ABD8
	for <ath12k@archiver.kernel.org>; Wed, 14 May 2025 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uM1re45O2wIlVIo/3+whtmMgKvQ4h1XZxYqjCsQfmE=; b=gw82jVk5xPTOnl5Ig1WebXrPlO
	+4TOHeZXYd56zAHpqVzecv9ud0BQKlHPmt5zstb5pIlf0MJOr6x29TlveivSscG/IbZEl3lbn+Gi6
	brpUgx5Lvl0EE7o0O7tMM87rpt6R50ILvIEOWVcEPKBgoNSKp++HJEkwFjr2caXtvWlK5JwK6r+Bz
	hn0cbJtzlT5E7LpcDILqMlC+Q7KjcOUWAsSfLyZfm9RxtvmlSLlpsTZkGDEEJLwNSXerPGujgRm3e
	HIfsO1maXto4GT+H9RPQVz/cY1isPlD5SyocL8+IuVI7igwHdwTnmmr3UET1pw/VfWEWoWb/ujA1/
	fk3r9ADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFD7s-0000000FQ0p-43KS;
	Wed, 14 May 2025 14:30:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCSY-0000000FFbV-19g8
	for ath12k@lists.infradead.org;
	Wed, 14 May 2025 13:47:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuw9g015222
	for <ath12k@lists.infradead.org>; Wed, 14 May 2025 13:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uM1re45O2wIlVIo/3+whtmMgKvQ4h1XZxYqjCsQfmE=; b=Mc4TGqMht/PxOfg6
	hA0BbEeadgia23CK8qnHA4hWxlKGTCqwQTgvPoDCIj+lVQ3cx/4A9Zk+UbCU4nDc
	KnRY+qJUPw1piR25whN/k19lK4Xsp8yGncvnboctU2OXa1mcRVCKccahtRpYjDgF
	uSA3tj8rRLeMB+sqsDExor1IczvedCknyEtdy1rKYGAveqZEMklTSN5Eg7ipxd+J
	+GTgFO51G+PeYEYU5+urmBg6AgxMutw4+tTmKpF38RUdnk5RfWtRggFQ2bbrYufq
	nG1T0t2gK2w17agcqtUaM1Tx+Xe3oRd6eeY0qlAuXC7ofLzmwksGqV1ZEVI550f+
	zNentQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr2s6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 May 2025 13:47:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22fdf1d9fcaso26446155ad.0
        for <ath12k@lists.infradead.org>; Wed, 14 May 2025 06:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230462; x=1747835262;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uM1re45O2wIlVIo/3+whtmMgKvQ4h1XZxYqjCsQfmE=;
        b=JozOMwXQMle5ehFPtmjawPCiylbTAUaFdaXmmAMsGLnvB6t2kKZmWLVtY4yVFiNfFr
         Sp9IHiXY4vRI+w92uGcM9FFuZREreKoKttqE5WZ5Tz06w3NvdsXxHiYQzQTgu9lwoh4Z
         4X40Zw1BlFWOdo5qRi3A1+MeXBj1Nn1UkVC91IgozsJv2BXGbL1rEp1D9XGSGxK7DJgT
         h0r0XZHsjmFJWZJv1BTGbBQd8JhEoucJjR8t1EYzR+pCHJoNzwsqsDsasZG74CiPKkmm
         tdP1K4rV2SUPZodzZ6TpOS5QG1YvaWPJ8ZpwEqKLqiHztL0kqPPVQIBdEA4mJFcbM2pM
         6QTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV+RRha+TCiWXZI2ovSBzl2DtxcIcI0Q3NKASisyl4oHCLz5cnBWEWaO7G4oh4WgBoVQ6XeYw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Rn6uaf1hsFoNMsIPV+VB8KYu89Ex3Ud5cZElbSouWuQ51cjw
	X4Dq2fmRIoN9reWSBa4WmErNgClJBCpfFNWnNSmGsjRn5VdUL4Z4wU4q99OS6sxcmA6+UuW+eCt
	UoJEjFbqy4BivzJnW+F1S3nZLnKmzfNjqLT/Pi+GQhe+zOz0pbb7m2EKRHwD937JaOm2f
X-Gm-Gg: ASbGncseXjInwZfO4MNbo7WyRiNjitGNy8wsDNjBu1vD523GXuNIaRnTDAGWAkKP7zP
	MeLpKqc+XRcyeE+J9pt33pNNNME+cWV9CU3v/zMNbKsLeSgS8U+dVrps2I6AWMYeXb1Km/lkwDL
	aQN4XZu94n3FkSU6WArl8OMZFqbwgGIat7A+S659AwXfypqWMMWLzmoeV4wyg7haRFIw3XhCCPt
	J7pzmHxV1l5wjf9wlFsKdotFcRNwVpb8thkZjS3WVI+Nbjjn5YQbuOstWdrjXzeFFwW9cbznN+Y
	YeUEQsqjlvmOUolhd3Jqag2slgTRmoP3kcbR+ivl0HGIki9ozjaRKwQm2HStWRiaJo4=
X-Received: by 2002:a17:902:e54d:b0:220:ec62:7dc8 with SMTP id d9443c01a7336-231980c96c6mr44309755ad.2.1747230462452;
        Wed, 14 May 2025 06:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/Q3uPk/QbEWBOrhtr8PGNViB3LeyTkN11JRz2Zas4K7fDvgwbiBIbe9b160thz6soF12WTA==
X-Received: by 2002:a17:902:e54d:b0:220:ec62:7dc8 with SMTP id d9443c01a7336-231980c96c6mr44309435ad.2.1747230462023;
        Wed, 14 May 2025 06:47:42 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc753fe13sm98929455ad.14.2025.05.14.06.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 06:47:41 -0700 (PDT)
Message-ID: <ff4e8d8e-5835-4200-a479-baa0e44478f0@oss.qualcomm.com>
Date: Wed, 14 May 2025 06:47:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix scan initiation failure
 handling
To: Vignesh C <quic_vignc@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250512065849.2833232-1-quic_vignc@quicinc.com>
 <52ff43fc-160c-4efe-ba9e-42a0c838fb3d@oss.qualcomm.com>
 <f0c8009a-829a-43f3-be03-c6b2a0b67883@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f0c8009a-829a-43f3-be03-c6b2a0b67883@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O6vDKWl7eeGOSGSS895pkEfvGUq4OijT
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68249f00 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=nJ64htB4QhkbdbSvBzUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: O6vDKWl7eeGOSGSS895pkEfvGUq4OijT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEyMiBTYWx0ZWRfX8OlqsZuj596v
 zfFbiCD5P1qxNUqk3HHWwgPidmRdlphK1U95HTByi22bdntsXgTK66nsi9T+QqzteJSlenYeI2w
 OUMo5H8ZbaJhIi1dxJhsHuPFmiAF//pnfnhosM+yESVt49n3a26ZQszEXKEwijD1e1+UrCM9Li7
 A+9yg44SqGF9uWifh1rgUcTu5Y9tJV7Hwm94v38kaGS37TskoUua59GNmFbkgwYpD6F4ip7yeYM
 tkVMB5fv5JHLGRbAtAGEbXP5QjzZF0WoDKobKddWw4l5Dv9kuZOyD2HhlytDDRnJY1xZm4gwqe/
 tH/4nJ8KoRxtDXBQvi3HdvmnwFrlRBW5fx4576O51u4EzNTMr3O45r21/mRJZFWW2LIRLva5+sn
 /U9u3tpcWEmxHy3g9y0MoMI06dcbNZfg1brgT+kHDezxODYDnfDc2cKkLeNgXClhEC5VItmr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_064746_434837_362921EC 
X-CRM114-Status: GOOD (  12.85  )
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

On 5/14/2025 4:48 AM, Vignesh C wrote:
> 
> 
> On 5/13/2025 3:25 AM, Jeff Johnson wrote:
>> On 5/11/2025 11:58 PM, Vignesh C wrote:
>>> During a code review, it is observed that in the scenario
>>> where scan initiation fails, the current code schedules the
>>> ar->scan.timeout workqueue which is not necessary.
>>
>> Are there any user-visible effects?
>>
> 
> When MAC debug is enabled, the message 'mac scan started' is displayed, which is misleading in scan start failure scenario. Additionally, a scan timeout work-queue is scheduled to attempt aborting the scan, which is unnecessary in such cases.

Since there are no stability issues this is not a candidate for backporting

> 
>>>
>>> In the scan initiation failure scenario, exit the code instead
>>> of scheduling the ar->scan.timeout workqueue.
>>>
>>> Compile tested only.
>>>
>>> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>>
>> If there are no user-visible effects then I'll drop the Fixes tag since there
>> is no reason to backport this to stable kernel versions.
>>
> 
> Kindly refer the above comment and please let me know the next steps.

There are no actions required on your part.

I've made the change in the pending branch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=4545ccf7efbd97566eb6d98738013bb6d72ced05

