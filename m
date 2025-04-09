Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16E0C36002
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 07:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdRg2WZJaSV+G3gYMD9b8c8M4t/mejGstBus0eqmC24=; b=Y0Ugq2C+iFof6gniRwghDVQ2dv
	bNfvNMBNPgp1ujpikFa+7O0ROJYhzz6+DbEs/IUU6TbNC52T5G1Hn7qOa5Kp42xObycojaoQfxBFO
	xJYygDm/vnUf0Ujr6KWIbno6C3bXGd7Rtfa3+SEuZgxtUhFY+7G2EDawJq557EADrTGoEcG43nZAA
	AduV7FYNTJmohBz2RKePUWO47cR7dg1jqWxGNHbl4S/MwgrHoJRonbwqp1kXUFvj7zYPng9YF8BGW
	cSCS5NyfsohcTmUGVgIjUHGYmHQZ4eFX7bHURvHTf4pXoLGZRT2V+Tl+1RXmnYq8NE9N5iPrczFAw
	um7xW3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PsZ-00000006Qcf-2gAP
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 07:29:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Pr9-00000006QV2-2fru
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 07:28:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYwWY022846
	for <ath12k@lists.infradead.org>; Wed, 9 Apr 2025 07:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdRg2WZJaSV+G3gYMD9b8c8M4t/mejGstBus0eqmC24=; b=gPPIi7VDx1VioIYl
	Rgx6ihiXSYb2sxx97kukHTzweWy00TjeTnroVQrHeSAdasb9WkzxCc+1aw5diHVz
	i1FoEruCjAx00KmB3wsq8dhgimprymbW73MZhUxtT0C5sxU/UrzfhTR7FgYTrnvg
	972kkAxYyNxlV8nYv9bJ747IDklIb6MxWsERJ5kVtwkQI7XwPoZr0fA53z1tqThj
	uROWt1R8GqZiRZQU+dfYEaIP/y56jWqslhJB/Xo2v2FuGC0hnELKzZOyIyDfjhYP
	yWDRBs2Aug1sU0lSRHlkPnB4f2DYvymlzpellnQX5LWcUUJ/g8fLpSAfb3gcuW2h
	VAGtIg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd02gq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 07:28:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225429696a9so91665715ad.1
        for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 00:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744183697; x=1744788497;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdRg2WZJaSV+G3gYMD9b8c8M4t/mejGstBus0eqmC24=;
        b=fw8rvHKA5fiVxY9myWgaa75brxAIoKYPvpH7X+0m8C5KVQ63oG2KfzO+p88iqVAPrd
         aLmairW9C/e63c0HuJnZO3iLeBOlA+CHyYezredefh7fHim2x23xD1wVFLvV5FnJOhRJ
         FLQ/Iw20RyTXhoq7OYNLa+lC1Ys3YooZ39ACYnNDA2YTuYdGPMpIL0+9cIyUd9gFhsTh
         PwyTLHboYZfWJ2ObAsDwPLvfn5gmWaWsYXqSFQaBc1AUGjtDemtDkdZIiqtvJtP3wLmD
         98eJDBkmqfZLAGxa/J/tq0kUyUsIg9g9hoWWAKiFSJvMX/ajg1LKR0E/9BUL8vVQF8IL
         v6DA==
X-Forwarded-Encrypted: i=1; AJvYcCUUciYCrBoLOmCKQDIrvOvbt+R2zPL4uhqhqZw9YOu/jAmYFWjTWEymlo3Q3q1H5oVWGoK7NKI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqmV960mCnMvB6nCEwrzzGWvPuAV4re4goEb9AlhopIyg+AkYe
	Ue7jd1NeS1q4vkeaAp/bg3Dw4FWbgfzoL2gvs3F93fYcIqvgxUXfZxVV6W1nt0AbtEUx5ioscZd
	QIn8MbCrxjQH3hEZL1DxOWRTHOyXaICJ55MI1aTF+tbowWrjFez1EPjjRNLzm
X-Gm-Gg: ASbGncsDbe3s9OQIZeI0Cuc7SHhb/L7zYJmosIkzuYvUqyW3QEBuTGfC9rYhBCTHv9f
	nZdjD/1Nh3zJErd0UTLXUdRuLhXyzbne9mOY0ZL1TsDfI7AfbwvfFqrGD+yh4npv/KYz3xNFCMo
	QU20P8lp3YlivZAEmxjoiyw4wvZ0FCUVSATyzlRP6gwORUHEbQ06xbWjZZVWc9T5WWEQe+ne5MC
	iHfJ9G5ELgyvatKkVQ0gakBEmfoETUPd4wgANqD5RZGiDoDTbSaS7qfCF1EyT8QWopTzv9l+7tY
	Ki97T9l5choXhmjXomqNpsXjOh/wWFweSi5Ajhr9UWAS++IpffAvaQ==
X-Received: by 2002:a17:902:ccc9:b0:224:255b:c92e with SMTP id d9443c01a7336-22ac3f2db39mr23747345ad.3.1744183697252;
        Wed, 09 Apr 2025 00:28:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyPWcXw2pW4F3zG9g2x1upc4P+xWNuWYHU/j4YdWOlZ05n9OFYdxS/3HwW187PAKJikXobPQ==
X-Received: by 2002:a17:902:ccc9:b0:224:255b:c92e with SMTP id d9443c01a7336-22ac3f2db39mr23747125ad.3.1744183696876;
        Wed, 09 Apr 2025 00:28:16 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d4677asm629295b3a.55.2025.04.09.00.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 00:28:16 -0700 (PDT)
Message-ID: <94bfb5b1-6a24-9d70-9f35-1fdbfa1a113c@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 12:58:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: Resolve multicast packet drop
 by populating key_cipher in ath12k_install_key()
Content-Language: en-US
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250403082207.3323938-1-aaradhana.sahu@oss.qualcomm.com>
 <20250403082207.3323938-2-aaradhana.sahu@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250403082207.3323938-2-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wMOQuNQXNVrO_5IujedpYVg2hIisaa3i
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f62192 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=YvOhKeZPiAD0BIR_EI8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: wMOQuNQXNVrO_5IujedpYVg2hIisaa3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=913 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_002819_817396_75C5E638 
X-CRM114-Status: GOOD (  10.04  )
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



On 4/3/2025 1:52 PM, Aaradhana Sahu wrote:
> Currently, the key_cipher in the ath12k_vif structure, which represents the
> group cipher of the MLD AP, is populated when the link address matches the
> ieee80211_vif address within ath12k_install_key().
> 
> However, in MLD AP, the link address and ieee80211_vif address can differ.
> Due to this key_cipher is not populated and multicast packets don't get the
> correct cipher information and resulting multicast packets drop.
> 
> To fix this, compare the link address with the arvif->bssid instead of the
> ieee80211_vif address.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 3dd2c68f206ef ("wifi: ath12k: prepare vif data structure for MLO handling")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

