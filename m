Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B18C02198
	for <ath12k@archiver.kernel.org>; Wed, 12 Feb 2025 04:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmkM2sgKl/os28MvWYbqe0+++DekWCHSvMHgkykMltk=; b=WpSIhpK7oFnkYHKg2ol4eKXp0t
	p76vfYgvLzE3AnyqwErjJ5+TcMN16ApLZ9If5Wf8LrabheHnQ18kZjhUmUprKzZxkLia37aR3dZKK
	7qffTUa91q8BxKY3aHcVi+pitbmyIw+rbIcpemI3Vk7t4mgrUAPia6waNedzdhZ5cpHwJlEo24SFX
	RQVcJEJ3Xffco/H9AbojwdELJRvc/S6L+4Mfuxsfu692ip1JSNlvXd1ZyUL1q29BriwOJh1/WvEPD
	OkzImVF0EkBtJKlOumbCWpPrKjjqMP+2J4PwQxn3tGkDV8LPR6WqrSf6BShbznX8TiGJTxZrTAu7K
	hXFA1Y1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti464-000000068cO-27Pr
	for ath12k@archiver.kernel.org;
	Wed, 12 Feb 2025 04:11:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti43s-000000068Gf-2GS2
	for ath12k@lists.infradead.org;
	Wed, 12 Feb 2025 04:09:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BNvxTi015690
	for <ath12k@lists.infradead.org>; Wed, 12 Feb 2025 04:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmkM2sgKl/os28MvWYbqe0+++DekWCHSvMHgkykMltk=; b=A6hEwCf5JEJvcfyr
	/DkXYhvoeJO+wWjVumyF23ub4fBEL+GCyGHjlJQT8pwO6DoDFsPrM3j+5JhKLtj/
	5DXP410RczMDyGnhfaY18tZpvdAivkAz4mJxzenLh1aex9L/qFdZ2g8/b2BY8F4q
	vwFD6az/Q5dxdpKYamEaB84UevFuMmXoAOkWeLvWs08oEYKAcpMOlOfsSU3lleIC
	ozBFDXDQQ/44YsW76HuRTgyMNJFj48+f03soYzNbO7EtpcVoJCxPGoP0JMuBsaG8
	Zxl86L+v0Yy4F3c1/bYnP0a0ljUDdHG96gUzLx3cyYDHC6UXxDeHfrcsaJKhIx2J
	V0mnpQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rgpgggch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Feb 2025 04:09:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fa2edc3824so9389624a91.2
        for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 20:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739333359; x=1739938159;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmkM2sgKl/os28MvWYbqe0+++DekWCHSvMHgkykMltk=;
        b=ctRxNfP1QBd31OQdE34gCSzmEkesBX1CmGt9dXG5+AsBQNnvruT6o/4XbPlLG1bGe3
         gRMThcIl80T1panMrIRBxR/3SaOs4VcbXOejrzDN+ubI4Elp79Hf2xfMcFH8fb4+kcHL
         0q9Dn0t6uYg7WdxmPMKGpcxffolc9k8eXEenrKBvX/Fd7HlHpwCd/hKZI/luBTTqKPiF
         gvv8qaHs4M/mO6HRPqsjUUPI9fK1IsDFYkqqQDCRe1HSPjht31ZB63K5rHKy+tLrA/hH
         vnDKV/UzWk9DXEFmZI1xRGdbG0ePuF9ctsnL6/yjOVyPTmPs+qb21K34KBW5d2cSePhF
         GQqw==
X-Forwarded-Encrypted: i=1; AJvYcCXjFyTo7cFeOtEqQCW1GEAVtM9+Wu+TXSMGpvgf6qI9siJj9ReyLwc22BkmtDF24I8o3p6MnQI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaOZ/CVoMivFX4L5+cWPUz5PNfXjUUv0c4aKc/RxIBP2O2Fgso
	uTd4pggKJ0nJVaShKMbkTfWfMZ391t0vUKWUtuAOFceEtx7Imu+YmDcQ6exxhKpkObVFB4/ST4G
	J0HlUuBbmCzt/WKVCoyB49fzeq5qPdEMpr9IpKwrQxxPoAbG5SEuScLCSY6Shllpupmza
X-Gm-Gg: ASbGncvuWRa0fOivP9xDGzzBeAMiTCO0+WoVbnS9i7gsNyvv52ScCK2ajw0sXnBbIoh
	VedRmbXc+XgBVBeyVxPSpUAGyDxejqlVM0OxYR923t5sHgslzVEY/8Xu/CdyawemuiMi6Wqoq4E
	hXDtdOzKKJ451PyADzvUxy89xtjWdgFwbRv6P1/HXgtu0QRLzKNyX2IZyz9w031Uy79zRTxdh+b
	jrBnTtL4H3HIP0cas5N8ZH1rsS5IuAhhE1e34jtA8Lhnni4JEhrGc/QylEnGfVJK38qe33tlWiz
	yt2Q22wJRx0MONENA9tVBt9tvw26d2xvwaGIdvkCbAxU1Ig=
X-Received: by 2002:a05:6a00:ab86:b0:730:74f8:25c7 with SMTP id d2e1a72fcca58-7322c37c0femr2427625b3a.9.1739333358618;
        Tue, 11 Feb 2025 20:09:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTqahfub5fqTygv21tDtGBIbsQicMGyjE5EH+CHy9veEfQeMdI2r/bIVUx5ZRMWVvonJo98A==
X-Received: by 2002:a05:6a00:ab86:b0:730:74f8:25c7 with SMTP id d2e1a72fcca58-7322c37c0femr2427595b3a.9.1739333358204;
        Tue, 11 Feb 2025 20:09:18 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7321b34c003sm2263027b3a.52.2025.02.11.20.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 20:09:17 -0800 (PST)
Message-ID: <03697f42-7237-9ea0-311b-ed0cc5ac4e7e@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 09:39:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath12k: fbx: Add missing htt_metadata flag in
 ath12k_dp_tx()
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250124113331.93476-1-nico.escande@gmail.com>
 <48cea2db-c6a7-63f1-5e3c-1db77a6fb84e@oss.qualcomm.com>
In-Reply-To: <48cea2db-c6a7-63f1-5e3c-1db77a6fb84e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hRrPvQtBtwn1GVVItFotprT_8s6xTAvO
X-Proofpoint-GUID: hRrPvQtBtwn1GVVItFotprT_8s6xTAvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_10,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=890
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_200920_587194_70DACA1C 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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



On 2/12/2025 9:37 AM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 1/24/2025 5:03 PM, Nicolas Escande wrote:
>> When AP-VLAN was added, we did not add HTT_TCL_META_DATA_VALID_HTT flag to
>> the tx_info's meta_data_flags . Without this flag the firmware seems to
>> reject all the broadcast (ap-vlan) frames. So lets add it same as ath11k
>> did it in commit 5e8a373c8699 ("ath11k: Add support for dynamic vlan")
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: 26dd8ccdba4d ("wifi: ath12k: dynamic VLAN support")
>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> 
> Thanks for the this.

My bad, I meant "Thanks for the fix"

