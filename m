Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFECCA600C
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdaWk4J1SUSy1sTSJCUeAg8gl8VQADSdN1XsBILOqy0=; b=L/rWt59y4CSWJFgFqtViqGUb2b
	sGDkUKpctBNIdi6byuctMJdCz2BUDl/g30rGH0KNVa3UFsnHKGwkNyFEEawjY7uyIgsDwKeA1vm/0
	fIE/eM10feAX8UYHWhGorjesYDqAAWeV+oTAEQTo0YID7Y1FatmNZ5HhmouBdDbO/WK9oh03V2gYu
	ZfiqhzEgeMkJWstO4RMSQWDtvEhATqEH1A1eonKoqrgH4rIRj2rCsNci8EMgCtnnc9KZB8lgjldda
	e7X+0igF8fjooNR+SswmudO3AYxKdMu1jOA5goYWh9fV7X+qijoBCEV2q3xvHAMoce5O8ByVZQ7e5
	ihF+uvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqK5-00000004d8y-05tr;
	Thu, 08 Oct 2026 15:46:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqK2-00000004d8T-49yV
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 15:46:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVgLW3642066
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 15:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdaWk4J1SUSy1sTSJCUeAg8gl8VQADSdN1XsBILOqy0=; b=IDdlC7KLsT28Pq70
	Cav7C10horl4ykdp9KDt/xN30o1lwfnsXznhVNewT1tfkI7CQ337bR/X+2EKwtwF
	NFfN2sCP+wZD0KA6y7RJwjRHvftZSPu0o2gczo84BTg+AWx2ng2ZiXY1hcThulTt
	o2Y8lp5e1jyDmiIUnVepUR7GTq2+JdltN/bu8Q1mwhNil/Zv/lkPL7XSHFybSq2t
	RpLPLN/c51OsdkuXSFYcb6iucFZV2i0qPaeawj+4HIFlTZPYiSebeQiAOUotbQCV
	iUrth8CRiUGQ7OZphJcLiV/j//H6lRwgcmmKREZ+Syds6hAGERztWtpsbWwTQwn+
	SsGp6w==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe43kmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 15:46:15 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8242e72d404so9809299a34.2
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 08:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791474374; x=1792079174; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdaWk4J1SUSy1sTSJCUeAg8gl8VQADSdN1XsBILOqy0=;
        b=G7SkteE08fXJTjjqw9Wm4CmoKCbyrDvfi+u0bQnVFenNbMnnY0A9ftMvJUcxgrUKfF
         qohL0lVbhC9aUdZPp/rZj17jhORky7Q3eDEtCkd75Ro6ljK5OcrwBSPnr3THRXXHHNCi
         Bnc8iyrcbrhMSqHQhUdDuYDSatdmYtG5QIqswBNf3YLRetEepkVViAjyzzOiI2kvfQSw
         yaN3LlqHfNL9RGS8MwhiwFqIFkduG0DgB2xQIUCMhn3u/+oclWW25HqxR+2ahaO95Fws
         kdhrwCxZ9injt4QiU5+VgD/4FY4pgcIA9rxrmHDkwQ3rgNfh8RlpwInL/ASaLLvowVMR
         lGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474374; x=1792079174;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdaWk4J1SUSy1sTSJCUeAg8gl8VQADSdN1XsBILOqy0=;
        b=p/BnPBhaJ5vsNaboP0mKIBhpeGUYy+ujo+I/B/KhF3DEFL0oLrHNRKI6WHxVunv8TQ
         CEeZKaSDAjTFS4Gw9QsoYj10VxTuzmQJ0KZkQT6AnLWBot5pKUZsmr3RjqG8EbRQWEjq
         9YldzYuIv9NlHFmBByHpDB/NU9XxjzpF3LWtx9R2MX2UNF9uP6JSsASUzd8jzI8nymzq
         JblJMODALQyJ1OkMVg8ToJgoXL7a9etdNj7wiU75X1HfX1E96nUaLxai3IA2s5FYWBLs
         tgFc2DH8iIO3/srrR/WFYsPnTI7DxuiwCAo5jn9r+IZN4PMZkuCQp29ZeWT5cYEJYER7
         z3XA==
X-Forwarded-Encrypted: i=1; AKwUvByaasFUSFgvIqImSf8U44+Svrh4+P0MAtczMiF2mLEW22QadtDLeX9v3Znm3d5AHKdNO3dDNIk=@lists.infradead.org
X-Gm-Message-State: AFuF++m02vqnSouAzPG380TGQGSBJgSazlQQaQVxk7aCqLKbwSeluGsm
	RrZGc4yrnI99JAROpagygBn4XkUs9hwy2r2pfJ4dpxVBNeDeqegooFC6XfCTJKuRDTy4+7TVaqJ
	kBlRRgO3vfo275fJ+tMUGm78YM1yAyqWZgImXzW3UPi/ZFE723ex66p0zniixW6UW
X-Gm-Gg: AYBFou1fIur5kUmQlv0EWKdH9D8FR8HZE1B4a6D5E2fbEB5GGTzVH7TrbS1dx2oNTtM
	d6IN+Q4RXBH5hhebR8gYb2xXtv/hbW9aFkuWc4K7XAOyzZvJXzn5TuvnFKtswV3/Qql1DfsQiGA
	8Z3kcGjxr/EdhucDYbgunVwVwoGJGYxEqUsqzm2O3PrwqxzU78g8jfdnQw2eIF5+Jkptk3A3Zv2
	mBY/ZRWoiDsrHtm65s2C/T7z6yaLFsm70JwrIKTBnHbECJE9tMN8giwlmboRSfS0C4RCPZQawce
	7kOFh74XGkpcdc5s86NuLFg4B4PDtlj74MC4/7jaTFEYLpX2CEks+YX46WbLBrycEQJ8fRMmzFA
	v6LQt3F2J3GFjJgbQg2W7i3GG/Bc3WVRDY7r4Clld1S0=
X-Received: by 2002:a05:6830:2b28:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-82acd86affamr8593978a34.2.1791474374501;
        Thu, 08 Oct 2026 08:46:14 -0700 (PDT)
X-Received: by 2002:a05:6830:2b28:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-82acd86affamr8593949a34.2.1791474374041;
        Thu, 08 Oct 2026 08:46:14 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82adc3eb1d0sm5702069a34.10.2026.10.08.08.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 08:46:13 -0700 (PDT)
Message-ID: <6de89bd9-ca0c-439b-9879-00d0cd5cc706@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 21:16:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: validate MAC/PHY capability count before
 saving
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261003101944.596546-1-yaojiale02@163.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003101944.596546-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LaX0WyH_y2hvO2k6XIBBConPaqQ-klaR
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac7bac7 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=CgAF95LDYrE-zO_MwBMA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2MiBTYWx0ZWRfX98ABsXGKxBu+
 7Om+48wDt8JlgN49gSRHb59htkRwQcls95UQuYynj++lG4+aomfNUOISVd07Rz4LIjiraEq5Kny
 rE+5pZw17EAmWQgsoqsYHOEiT+aB2NA=
X-Proofpoint-ORIG-GUID: LaX0WyH_y2hvO2k6XIBBConPaqQ-klaR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2MiBTYWx0ZWRfX5YmkO84fMcy9
 0iykxBzU41pdBhjhRJpqDhq0UqOhSsEBbY0lKcm3otM9u1cS6tBFV/Zm8MVkbNOE3cDyMWWU0vh
 W7Co+oxb9t5/9pNVqk5udMXoxW/hidRKtAPDzuXXxVKqfKuddPeZcpIhxV+CB4L5ppZgtunGAbt
 r23vJGCYZlxVo8QJ6y/lIgrNvsThuu5YQfLQk83JwlCRjaKYXh3E0yMbOUM+GY/W4J6Buj1MvUB
 t3IU7UV1ema3sfpyCKz+YENLK4lEKlX28qf/anbBB9EIVqjSo9pxs1eJhOTmBCLdXmvByh6fEZR
 QmTNIAJAtgqnmQHFRvr/lH5lZWQwofVPyKMAsv0Ww9ZgptZVAaQR+ICfEnpd6cecJpRkH/nONzG
 KfjkspgZDmf7HMtNPYrLrsDFXbn2LFbic3yqqD+fAyZFnj7FWPfu3rQ5RzsPxAukdN8Qq9Q4FhC
 R22tXeWa79fzi8Axeyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_084619_148919_45B81D79 
X-CRM114-Status: GOOD (  11.08  )
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

On 10/3/2026 3:49 PM, Jiale Yao wrote:
> Firmware supplies the hardware mode count and the PHY bitmap for each
> mode in the service-ready-ext event. ath12k_wmi_save_all_mac_phy_info()
> uses those bitmaps to populate svc_ext_info->mac_phy_info, but the
> destination is a fixed array of ATH12K_MAX_MAC_PHY_CAP elements.
> 
> If the total number of advertised PHY entries exceeds that limit, the
> loop writes beyond mac_phy_info and corrupts adjacent memory.
> 
> ath12k_wmi_mac_phy_caps_parse() allocates the source array for
> tot_phy_id entries and rejects excess capability TLVs. However, if the
> event contains fewer capability TLVs than advertised, the remaining
> allocated entries stay zeroed and are saved as invalid PHY information.
> 
> After parsing the MAC/PHY capability TLVs, validate the destination
> capacity and reject an incomplete capability list before saving any
> entries.
> 
> Fixes: 062ade23991e ("wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

