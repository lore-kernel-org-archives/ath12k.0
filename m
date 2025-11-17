Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7260ACEACEF
	for <ath12k@archiver.kernel.org>; Mon, 17 Nov 2025 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xbd/M+85Vw8s1cKki8JfY2ECZPNgUg55KrvYQLAi4hU=; b=3lrDXF1KwHksaGc6Gsfw0LqpnW
	VErGR8AXtbsoUvV0XInaJBBsw6AKRjtNVCzrVhTJWk2Dzt7A1GGLHKWGYhxQCYRmoOs9G9ES2J2WA
	fUfndAod930A2ouG+uIlmR9EBSSt9ASU+Fvs79ybOO3CnXfS4xowRuxh1ohfVf1Q0lHt9fYmEome1
	rmZ1WI1rv/i0QNm22BJV1556jPibjv+GJQx8YLvpwP9/OYFN99Z6auKQWzu7s3xajOaQrzV8dzDsz
	8gmUGaw929gmIlZuMDRIJiUO++xLF06Kynl04x/SFTZ1Y3C+mCDgSuVVRABK+ryZXr2BtAQPVISik
	B8CTpZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvie-0000000FoFl-0Jlb;
	Mon, 17 Nov 2025 09:40:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvia-0000000FoEG-0Hmz
	for ath12k@lists.infradead.org;
	Mon, 17 Nov 2025 09:40:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4o1oL2851930
	for <ath12k@lists.infradead.org>; Mon, 17 Nov 2025 09:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xbd/M+85Vw8s1cKki8JfY2ECZPNgUg55KrvYQLAi4hU=; b=LPELYkN0qPh8NQVx
	ho7nt7iBoDbMmvC5nuYX1Oom10iPvtqeX4anvlzr66M0t7I7FF5asu0UWTakDuY0
	vzoHVQy7k4K2WOusrA+kkwFDoFFdwSZdweenQpAxzTAlmlKs3gTRCW6A8kfNJdOW
	hXp2DY/Jd1uZcg2CJpbh6ZzBnbXF2S+Ny9l8ca7MvpGCM+cEY8PpnhTt8EgVRvrb
	XW9iANvWA/m3NMVMmdRSxHngAKgON8uZCbPox00Ugg8lIJ1RhanZ9qp+0avsLV2M
	RHbG0iaQJg3gVJWPJYFyPYQus75wz+GgaFF7PmR7wzuOT7cSttH5EmlNs8PQ4pvB
	YTn8Jg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh0c65h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 17 Nov 2025 09:40:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29806c42760so149723155ad.2
        for <ath12k@lists.infradead.org>; Mon, 17 Nov 2025 01:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763372415; x=1763977215; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xbd/M+85Vw8s1cKki8JfY2ECZPNgUg55KrvYQLAi4hU=;
        b=BkXdQMLetQvxDZo6Qb6BFj7WcPfPTwPMeK1uCWUJ5F/j/9PxY+vc+U96brYlH7Q2pf
         oJ+VeCULe5OJFRZoJQrnr7HBAW+j5TBj0BUoPwWGLbsiQpGl7dtQo6RpGVJFXfUI15fu
         Vu34SAkXivkMGx5tNvtf+EvVbf4b2Ft6ZROSOMz18oa3mZYxTHTQouzjcyRgcmNkZ6wO
         +57WwShmUHoJ86g+rzLNmzGeXOs/Zv9zUqMdunDs7N82+jVbDvLDiFKJ2sg/eK8wilmN
         q5HMZ+nDokLrLdc3WR4SJY8MnaDsbApZOcJDEnWnrx+9KRaXoerQv15Y6gKI0TGk0PsG
         PHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372415; x=1763977215;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xbd/M+85Vw8s1cKki8JfY2ECZPNgUg55KrvYQLAi4hU=;
        b=eE0Zbvg61xbpYJa3i9k0rvspW2Ws8PE0+H/p8f6ldP+WJykjlrybYv6MPlVbYMdxPI
         NYENfNjdU887G3m1Hxl2zL+VXELw6Hm7NR8kdSP9dO7YmBBs6KBTknmfaUu/iqNavEE9
         8RennpZkHzz03tYwZvDqD6TyRPUr+3g2QBF9DmP67qMrNEU6WhxD12njQ2H37WMAXu7J
         6SddHTFLKj0F5Znw47JcYwN+bSQ0rCrYH2KsheYmxPgg6FU9hljP6WqM/ys83rQkpTDf
         tAh2Ygj0fSi9QJKufps1XPfVrkdiqmfdTbkUkJxZ11JrQ83KXy9V3GXC33xXyXrSZrI5
         Fyqg==
X-Forwarded-Encrypted: i=1; AJvYcCUD717ftC2L0FvHh35JjUL0enM6fMnDnIPDvMWOpIft0R4lbQsQlsNXQgfRWXFiopveVFR20uE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt04rq6CAzgGUaPt+be/04KF8XzgzlhGSrLvNNv6ds4PiaK5g2
	jz9dXfc2ebk0/krknBTXFyDD8muY7tEhVygGeerFCNJYZz7avkXZ2ERiKncL+WfkfFeodtqWYeX
	y8eRmtifiINTyeqhaIFsUcSp3uWJsVYJkOwk4dJAOIYPySAPkr7Md0avk9Fi09Oq+
X-Gm-Gg: ASbGnctdLihOq9W6P8fz93/A3XomOntb/1HO0HfO34y36a7NExMWQ2IdKiMKYR1YYpz
	Lq1Qd67BnrLv9u9QkbDJVoPJGkeqTz70J4cMMqSyTZ5HonopnpAtm6eBdMDuqhrTgRUYV+bvbB0
	pdZMpmY9meXQtSIlEZKUYZn4ijty+prpkp9xxI4gJ7kmW2GiVvsWUvVsxWUCJGTv9kb6kHIound
	kRL4Y+9qo3NxXdttSdleK1sndbIvpom+vxHO0ehesEPjLlTAfMKReei3IBfTGXtbfSd0fExL7i9
	f6DUYXCVQ7pWHvRDTHvWG4bOWoIMi3PNCI1pVzuK2lVE4ydqxepBUEK3Pt/dtN94OVrh1VDFW6b
	hNt9WSOFHAaLV0QnxDrTkKhf8wimPPLglLiUFkT3Nrrx/+gMDzKrJCFPgg+6gwl8TM2nkQU7m
X-Received: by 2002:a17:903:286:b0:290:ab61:6a4a with SMTP id d9443c01a7336-2986a6d0441mr128562275ad.13.1763372414777;
        Mon, 17 Nov 2025 01:40:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFddAeopk9ZsDGbTtYli77j8FC4dnPHKzaKqbT7rUM+u8ZEVTzlfZ/5emnD6ZwaUr3gOC+XcQ==
X-Received: by 2002:a17:903:286:b0:290:ab61:6a4a with SMTP id d9443c01a7336-2986a6d0441mr128562025ad.13.1763372414315;
        Mon, 17 Nov 2025 01:40:14 -0800 (PST)
Received: from [10.133.33.104] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b11bfsm134601665ad.53.2025.11.17.01.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 01:40:14 -0800 (PST)
Message-ID: <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 17:40:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v1Hmds8qhVlE1oulN1mk-fiTCVGbEtkw
X-Authority-Analysis: v=2.4 cv=A8lh/qWG c=1 sm=1 tr=0 ts=691aed7f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DkQbIERv6x4r1F1n8LQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: v1Hmds8qhVlE1oulN1mk-fiTCVGbEtkw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA4MCBTYWx0ZWRfX2LEnU3QkAToO
 0GJ24I8zChDVEGjUe3OdDs+3t+EEhc7kz40GntZ4Ey4mRPMNQsn6TA05XajTkMF/j8vLZX6VPdc
 8f0OqmqVOXyS8h0qemKhvKKQEjb6dR50jKqjTYyGf6Ur+IeyClS17KpdGKdiLQxoYTKOXFpdg95
 IEuCiZqD9vCG9g45gbrs39jUxVqlsV616L13Dc9v6F18VhBCwzmpsa/VL6PEUXtTBmcHfNVExKR
 BtQpZlH1UrzT5esvyHHhem3cocp0kCrNzvq11Y0h8MX6LzDeQGynt24ELxc74fq9gc7TY4uj6AA
 KTSS2/wAe6Ovt1L7NEsvVNX89Z8b83VrX5BciChSSN4AUJEzOgxVqkgjgMLvaeP3zeXPgaxsXc3
 3d09HcMCkwK+59rNsj+4FlqkSuGTbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_014016_125360_C267CA42 
X-CRM114-Status: GOOD (  29.91  )
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



On 11/17/2025 5:00 PM, Manivannan Sadhasivam wrote:
> On Mon, Nov 17, 2025 at 10:36:39AM +0800, Baochen Qiang wrote:
>>
>>
>> On 11/14/2025 6:22 PM, Manivannan Sadhasivam wrote:
>>> Hi,
>>>
>>> This series aims to deprecate the usage of "qcom,*calibration-variant"
>>> devicetree property to select the calibration variant for the WLAN devices. This
>>> is necessary for WLAN devices connected using PCI bus, as hardcoding the device
>>> specific information in PCI devicetree node causes the node to be updated every
>>> time when a new device variant is attached to the PCI slot. This approach is not
>>> scalable and causes bad user experience.
>>
>> I am not very clear about the problem here: is calibration variant device/module specific,
>> or platform specific? If it is module specific, why the lookup is based on the machine
>> 'model' property? While if it is platform specific, why do we need to update devicetree
>> node whenever a new device is attached?
>>
> 
> I think I mixed the usecase of the 'firmware-name' property in the above
> description.
> 
> But nevertheless, the calibration info platform specific, and hardcoding the DT
> property fixes the location of the WLAN card with a specific slot. For instance,
> if the board has a couple of M.2 slots, users should be free to plug the WLAN in
> any slot, not just a single slot where the property was defined in DT.
> 
> Also, if the users plug-in the WLAN card of another vendor, not Qcom, this
> property is irrelevant/wrong.
> 
> PCIe slots should be plug and play i.e., users should plug-in any M.2 card and
> expect it to work.
> 

correct

> However, as I learned from Jeff, calibration variant property is also going to
> be required in cases like router boards where each slot is dedicated to a fixed
> band and the calibration variant is going to be different for each band for the
> platform. So unlike I thought, this DT property cannot be deprecated. But going
> forward, I'd like it to be used only in these special usecases. Most of the
> upstream DTS have a single calibration variant for the platform and for those
> generic usecases, this static table should be used.

If that property is not going to be deprecated, should it take precedence?

> 
> - Mani
> 
>>>
>>> So to avoid relying on the "qcom,*calibration-variant" property, this series
>>> introduces a new static calibration variant table based lookup. The newly
>>> introduced helper, ath_get_calib_variant() will parse the model name from
>>> devicetree and use it to do the variant lookup during runtime. The
>>> ath_calib_variant_table[] will hold all the model and calibration variant
>>> entries for the supported devices.
>>>
>>> Going forward, new entries will be added to this table to support calibration
>>> variants.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>> ---
>>> Manivannan Sadhasivam (2):
>>>       wifi: ath: Use static calibration variant table for devicetree platforms
>>>       dt-bindings: wireless: ath: Deprecate 'qcom,calibration-variant' property
>>>
>>>  .../bindings/net/wireless/qcom,ath10k.yaml         |  1 +
>>>  .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  3 +-
>>>  .../bindings/net/wireless/qcom,ath11k.yaml         |  1 +
>>>  .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |  6 +-
>>>  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  2 +-
>>>  drivers/net/wireless/ath/ath.h                     | 98 ++++++++++++++++++++++
>>>  drivers/net/wireless/ath/ath10k/core.c             |  5 ++
>>>  drivers/net/wireless/ath/ath11k/core.c             |  7 ++
>>>  8 files changed, 115 insertions(+), 8 deletions(-)
>>> ---
>>> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
>>> change-id: 20251114-ath-variant-tbl-22865456a527
>>>
>>> Best regards,
>>
> 

