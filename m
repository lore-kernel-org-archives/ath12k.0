Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96454C61DD3
	for <ath12k@archiver.kernel.org>; Tue,  1 Sep 2026 12:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UicsQCF2CHWzuvo39HPg9O428ToJvHotIHdRWV/p2dg=; b=tMWPszdSOU86gZpQu9BvsJ9nTL
	M/ALeqzlfZJLw7o9WYfTqsFtDOKAR6EY/xjx/xPOnaPpsv2wBkdzmrbVE/Gxw0jitg7ttk1AUgDVu
	R0tB4412u8xeDa76cb9S9nFWKrR0VHgXDKOFha0WFbQLDGK9+fCZYG0000Nwc4hcleLhXAeW7jWEo
	/O99eEZ2FW84lhvPELIBKN+TQAgXIMLzcECPAcI4ld+cE8McGcVXEiFhfYVWMf14IfOJ5na6IOEWs
	AT6KqKDmKgOjabRW/k9eExPK5qt8XvAiIDsYOZDCH6RH5g2zaIZCgwk7MtqNNgky7oeHSrDn/eVd1
	qGrNWpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NlJ-0000000C7uH-1R5b;
	Tue, 01 Sep 2026 12:38:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NlH-0000000C7tf-0LWe
	for ath12k@lists.infradead.org;
	Tue, 01 Sep 2026 12:38:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJIeX3406986
	for <ath12k@lists.infradead.org>; Tue, 1 Sep 2026 12:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UicsQCF2CHWzuvo39HPg9O428ToJvHotIHdRWV/p2dg=; b=irf9zcoSmiDPinKB
	60PluqS2vnI1lsOxUmCHBUVLANxeE5+APsUjKskvpzQEekTcbKXSncLl5oeu6M6Z
	vAUA86FCM7dOMEBoReY9kKpEK07FFOS9ELKOwDbBgObeS8uQWFee8prHRvR96N2m
	r2dLGBV/COzhVJFapfVPAIVKdhNuHx370XD5bS+vCH7kRp5BH9aJRn5jagnWc7Nd
	fQ6TyVfbbJxYaEqT2FfALq2dprYxZa1YM9yhy3EOu8EbRCs7RN3xvoYgy2e3j4yL
	Vgx0oTVGXkMC8gQ/Az8NcwaclewhP83CJv6iIryVS9AxRVTAdbD4wlrK7YDGpENL
	gt98Sw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu1hrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Sep 2026 12:38:46 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e99ff505c2so5909038a34.1
        for <ath12k@lists.infradead.org>; Tue, 01 Sep 2026 05:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788266325; x=1788871125; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UicsQCF2CHWzuvo39HPg9O428ToJvHotIHdRWV/p2dg=;
        b=G/4Nt+fcOTqxN+knjPV6x+R9z5Hs6+TWsCddAwMIdA+M3xVrWfSjHXb0IrW8by+kP3
         fUa6s9RzqmKIYPO+eWJcNbXcwJ0qICVd87sFjxfU3PebZvbBvWxj78VC5bFPk7I/EsPN
         ohJLoWMb1FvQbLR8PQ7ihgcpFHgwJSBzcnfprl3N/Bbmfz0ureRbnBEgUh0zXAuQrFOX
         LS2OVDabiCMcGtPAyyfSc74cjxOHMKIOv0AsskT5Kdy91UJzWnHZPeC54ovd2Rg6ultZ
         E5rlOt7PEEqzXoXjwH3/e5A4yUpGij+ZJEIVd/f1ypT2nQ6i5nzxfQBovDuvqskbbQ3a
         gUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266325; x=1788871125;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UicsQCF2CHWzuvo39HPg9O428ToJvHotIHdRWV/p2dg=;
        b=LQZRAbyIqWFvGP1MQd6NYpUebYR2PT7Wzl5vTLAlJjqcg9AIBOYthbvKxhoSpXirSK
         0UTx7NhJAetsTE9yKUXLpAQgfkVnYFAnkz1vOkk3wfrpxSHJSMkAPKL5CrKBDZSDVX6R
         39qrItWbC+0G09bZ/cuotn2xKe0/TtR4+4IgmFeJC7QcYuC+s/X+6XD5KJqne0bmUVCX
         +KS7Dlf/+hXqHdyuhPd6bcpDxwTCVN7L+YYU4/axAbZukO2tvUe07GxnB7UoM4zWLNuS
         35BsKWMJGLfSnP551v96PB/4h64J6hLEvEdc4urHhZv+jYkGQXlT701sFF2bVwCiagRG
         BImw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3HxKCNRYtmnOFwBYfDl7dlQUhFnTOUwlEcvf3Wa+vDgp7tLL0tjNkOQvCjkllY+nB9cGR7Ug=@lists.infradead.org
X-Gm-Message-State: AFuF++kqhz1Z85at44LKqW0yKBuaLoHMlIFpC4QGCEIpPPpFrZPrKeaS
	ZXXPSXjfoI7ZlLLIhDt9I3EXJa+DxuMJJLnePLKj9n0GBJIZD4TrnvLX5rML7Rqz2E8FmgQlnGL
	dyGZokgjqxeyiHTqeCfiyfVkcLS8vMFxs/c2DEUjmLDe0MDttqT7uxlmHzCsIjHYgfUHOVB73
X-Gm-Gg: AR+sD103Tra46y9IC8L0JvwtzD9+X3inryOjYG3zbFv63D7DF27KaxXrvFaLt1PZaZm
	jM5piZ8FyGHZ/5Aw0ZWvXz+A+Hsk+rV1yQMShUE5v3NAI88BBhCgEhI9LV/zgEzItvJYSXsECzY
	Aht40m1JTPDvfEE7Jqk+YCOm2/YUws11PR/qtgAOr72lh5QOwKEBySnjy2AyvJRfZWNSA7/wnly
	EfLzC46wuDJCX6f46ee2wo2QntCM9xs7VpUrsmCHWiYHeuPNBwM+JIXBo2TatE0A2IPUjijMZ24
	USuK51Cx92jXCjX8ttcGjt5e5c6VVRUUg5BG/wzUHOemWv0rwMVGinfLk1PwWHB4zzu+btc0/hb
	uwj3TOXuwmHOtY7Xocn/TKTG7R07hSTdtXdqu191XRc7S
X-Received: by 2002:a05:6830:61c8:b0:7d7:fbe2:9725 with SMTP id 46e09a7af769-7f68797bc47mr8447289a34.5.1788266325548;
        Tue, 01 Sep 2026 05:38:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39907b17a4dmr12472352a91.6.1788265945902;
        Tue, 01 Sep 2026 05:32:25 -0700 (PDT)
Received: from [192.168.11.105] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d18eaasm39622866c88.1.2026.09.01.05.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:32:25 -0700 (PDT)
Message-ID: <0fc0b82d-69c6-453d-bdf5-c51a9237035a@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 18:02:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMiBTYWx0ZWRfX/kPwjOi4vQcm
 h1XP6cq3FFpkYolW1o9+pnbXoehNEaxa83glduEVgKjCHnXu1fSTk+cHLeh3u7VT+XUIZaFUf5W
 Vys24Z3Kod3OtPfirGNVX092ufGOUf5cuaAdEAjWr6HKQPx8u5djTCqwr454/Evx2GiG1HsZs8K
 jBC3+m/nOArx/Fr3GD6KdaamttMaAF9kf512Z3uk/Cdxd2CKEoVg+2pN/Bfix89hfLLlgVWsm5H
 w4NuOJ0b5E29LkUzxG54LsyG4HM6IUAjtxS4391Ho5cS0prDPy09LUFE1CHWB/CUL5WKrRm6/Km
 H23Tfk0RvCeBoSzEhFZWZJaCJ5JXK1XqJyB7lmKwB3KvzM3cE+lqb5Q0GLCTevzjNmELs8C0NI3
 PV2mavlTp+7bKFo1l1XvS3PbMUNYbCgEJp9x78mARGey6qHU5Rf3tNQuy7Rh5q69pldtlZQ3T7G
 3RcfKWryGCNnVjzvH6A==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96c756 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=erCTOyO-HGHO-QmL5V4A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMiBTYWx0ZWRfX3IN7X0ggbbxU
 ZG2DrQqo4/iFT47qmMiyC2SFod8ZZ+n5vUWCSJJH4iSK///d1wd0ZhKzmjMpi/WU3FqPHl5o/R5
 sWzr68UySp3SyT0BO4WIwBpolPMsfTI=
X-Proofpoint-ORIG-GUID: iZ8h385m01ncVIfEolTU9IyG4K8HcoAG
X-Proofpoint-GUID: iZ8h385m01ncVIfEolTU9IyG4K8HcoAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_053847_130464_25B6C44B 
X-CRM114-Status: GOOD (  14.89  )
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

On 6/30/2026 7:00 PM, Andrew LaMarche wrote:
> ath10k and ath11k support reading calibration variants from the device
> tree to locate the correct Board Description File (BDF). The ath12k-wsi
> binding already describes using qcom,calibration-variant but it is not
> implemented in the driver.
> 
> Many ath12k designs expose all the radios under a single phy, each of
> which typically require a separate BDF. Without this, the radios may not
> come up or will not be calibrated correctly.
> 
> Fix this by parsing the device tree for the generation-agnostic
> qcom,calibration-variant. This allows the driver to properly select,
> read and apply the correct BDF.
> 
> Signed-off-by: Andrew LaMarche <andrewjlamarche@gmail.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

