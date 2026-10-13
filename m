Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E8CC6B03
	for <ath12k@archiver.kernel.org>; Tue, 13 Oct 2026 05:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SZN17hFW4GC9KUw1ogcVV38VClSXT6eMgRXyiGOLGY=; b=F/JAwgrqGTUu6kxw8qK5bjEKRN
	LgmM8kn9ZXe2jgfo80U0R35hjA0UfdHEA3J//2dJepF/btMe0aFvaUPI4vBEomFpJ3ZXQ9qHZviWZ
	bgTPPCzkfM/dhyhE7grgfKkUKnbmV46u3ufIsaXcm8VPZmHIBMq2W+3WxRx5HYV6HezOQtZpXhPO0
	hv/dFAP9j2BkhOkhUP1kc4n9k7TchnvCMyJ+jGTJCvvDzBx1z7tK3SCRQIzue69lhk6c2mKgpvDcT
	3gOhR4WidZP+KQxw2be5Non2QX0lY5yTdWNZr1tMihC+O7jr5xSecazz87q0EhzstT+oZSenfrcZ2
	N9N6UpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGUz7-0000000C0qr-3B5L;
	Tue, 13 Oct 2026 05:23:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGUz6-0000000C0qV-04Ah
	for ath12k@lists.infradead.org;
	Tue, 13 Oct 2026 05:23:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20vXU988971
	for <ath12k@lists.infradead.org>; Tue, 13 Oct 2026 05:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/SZN17hFW4GC9KUw1ogcVV38VClSXT6eMgRXyiGOLGY=; b=UecfDA5h0NXv0cGv
	x2XEaFlRXrOoK+82wOwqjLVebQ8tclsDFd3EW0P9rQ9SOaJbDgxN3+BQ8jrfV+uK
	lZNYZ+Wk0WQU/CI/dJLjUEhWwlM23hr4ul1KcF++WkLqEASlUluVxx9ima3e4GHV
	2EaLtBr6uP1Wc5xAowGZLct1AiilGHovkwWvS9P4Xa963xz5WbHE4GtKjbnXtSUE
	C9nvI5eefGMS9l5bpy8KVGSzdPVb0ME+vv7/l/l68Lu5o3zIqHilAmk97V2MaA3G
	Kv9OZW9lACSuS9pLUcJi7tcJv+Q174w9TRRLI7JFmTprljWdKMD6N4eOhNTgTj4Z
	UMyHPQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hc96sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Oct 2026 05:23:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so1701275eec.1
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 22:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791869010; x=1792473810; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SZN17hFW4GC9KUw1ogcVV38VClSXT6eMgRXyiGOLGY=;
        b=S7Qv+XCd3M98haxzc0Y7pTO0ZJiI/PFMmV+viGZdwmS35v5xsFaKIkFZ/sqjkVrKqX
         waFkf9cpH8yhSvXWagafYzvAyLG7C1Ufaaxl8uJ8n8HOMw8DK6V0ZdgZSgaGPi9ElwRU
         4gEpzcpDwTjR2L+Btb+q6wGM8u4rFce67z8StuIt59ZT16erp3BAFVEQIJcE8SGV29vE
         BndCNMKzhkrdMcA3ArjnI8C4F0X/afnrieKfqJLfGTya5mAIdAWJ8BOnEATKMd7948H7
         bN8Eu0htx+ztciRHMGB+intj8HAGG/bTRbq6BKa+MMRUAQ4CBF25CBctOtdRYM26LoMf
         8DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869010; x=1792473810;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SZN17hFW4GC9KUw1ogcVV38VClSXT6eMgRXyiGOLGY=;
        b=OP35oXigVGsOM2rQDbM/TPzoksd43DSWf69nDyovzqfDJNLSwedXu9z6o4pDTj4y7c
         KqWhzzhvLi5sSfdfLBBp4PpcQgkQaIIysDVo46BqoRkSGNj58MF7UDEfEoBZAJsFY3NG
         STIprzNKnEzqh6+pLxfrBFmr8+2ml3jP01qFSxqXlr0HuuvJXtOyBVKGR5y8CEMaFnS9
         OvpC4wvRlds72WloKgZmnzZfoRFiI9EQFSpURlMCNazZPH5Wlfvw0WVofngAFFbY/OzI
         lsgo05RW/fd3AREWwPH7Nr+fIgy6fWybC4jmB23vLfp9nQ1B9OvFvrvqNqCDH+CqgPdb
         6Wow==
X-Forwarded-Encrypted: i=1; AKwUvByYEWyaEwqfWfjbTdWpCexidHU5AN+X+MvmPxpDwMfkkVCUn3Gc33wxw+FFx6kUPTNGKFzh324=@lists.infradead.org
X-Gm-Message-State: AFq9FYK+CH3tl29gtlyBxt6WblfSc+9O6xMMFopsY8wOr1EBi2KIrQV/
	UMlegmWP3ttLmqb2cpWDAN2H1uix1iGhQydx8PZzq4CGx+PXbvMz/pYtW+fQMFkJxZRTKTVtncE
	CbRc0R/awrL6gBVZncnk4/Y0rVDncsCrmlj8Qi2/kpvgNNcjoqVA+zE2s7jNiULTe
X-Gm-Gg: AYBFou12JGSlRf3Nu+eiK274yxFFhdCIrzDWGmVwOPMC9lkbL3fbhuu3weHk7wHKYV5
	1E4F2PsMEcCI+TQbNb+XbcmnnhMNYt7pSYwm9x3nodtu+hObbDk6tfgrxkCeWyavOQGCexttgAE
	rGXvutzqcJdHm4bnJMBk2DnXK2iuuU3kr50IosJ53VwafEiwWA0huh4I8yVivPwcmEPl4JJam0Y
	pks/FMM3PhODdaAg0djH/bqkmJQiZlMhtSIKIKo8RZdzGlyJAavU1OgDUkpjHpGvyO/yS69ZO+N
	I09Ub5WXlhufeP/Ms9HJMZwCnuuhELcwq6fN0AZqPv97qCFuYfGP6mTt0ZzgxLvHPREMZwi86kb
	6N0Vm/iswvNFRo91S8JZOccBjO8LPaUXrqK+St0iZ
X-Received: by 2002:a05:693c:87c4:10b0:356:4b46:9393 with SMTP id 5a478bee46e88-3564b46940amr13288199eec.24.1791869010107;
        Mon, 12 Oct 2026 22:23:30 -0700 (PDT)
X-Received: by 2002:a05:693c:87c4:10b0:356:4b46:9393 with SMTP id 5a478bee46e88-3564b46940amr13288167eec.24.1791869009486;
        Mon, 12 Oct 2026 22:23:29 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm44915106eec.3.2026.10.12.22.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 22:23:29 -0700 (PDT)
Message-ID: <657ebc48-0faa-46cf-9cac-7fd06b2547c9@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:53:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: assign device id from the WSI index
To: Benoit Masson <yahoo@perenite.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        stable@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
References: <20260928213322.98949-1-yahoo@perenite.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260928213322.98949-1-yahoo@perenite.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMSBTYWx0ZWRfX9ypEyTQXCj0g
 vkgGsamp3zYS3A988PI+gawr99PpkVlqzLea79Ag5Ap1s2NLl0zrawJ5cjrsdgTh3hfbHDwIrEq
 kbXuA25F8uznEIlhVsPYrTWaLf8iOE49uJcXo3LFqPYYp41fd4uIb0W+DFIl7gfWhMa5nE8+DVL
 zcNPpWQqh1sSwG/eSUnrUEnDv+0cXecPQQiSl3dXQWuvrO3hg+bD3mxAIy3EksF7VbLgHhFDmZQ
 4htpqvztvs+M65788LjeBZKEwjr0o58AvYi+FpDNnd8Wxe4aDe3dbb7WB91GvgEqcymIG9SHt4b
 JYYOBj/zWW/IVoilful8zdAlJQHyfSBZIOxuf450Mj7LKSPyvj4rbxmp+3pQf15dakfMF+MmHiq
 g1QApm8eSNTdx+MueaLYl4j9ZV7bHYiZW/m6LS7YSDfG9hifXzY7FyALmymgTfST6QF2Eu8G9HF
 muw/eFn5vQCj7dv4Wyw==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acdc052 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LV5C8B2hAAAA:8 a=33sO1Vo68oqyLtPrM3MA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=uiVh3g-rw18WZz7NjXbe:22
X-Proofpoint-ORIG-GUID: wqpusnz6vdGYMkfHvTms5YPn0aadGEQu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMSBTYWx0ZWRfX3xBfXhNVztqT
 Sjfr8PjuWFJwAsvs1sl/GpYb43NNXs/Bu6ZN8ZWivNJv7+PqOAl2LnZfUoqABaakPITV9ycV7eN
 flwtc8whX/Z9MASxVO3N++inruLypHM=
X-Proofpoint-GUID: wqpusnz6vdGYMkfHvTms5YPn0aadGEQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_222332_086199_95B56420 
X-CRM114-Status: GOOD (  13.04  )
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

On 9/29/2026 3:03 AM, Benoit Masson wrote:
> Devices of a hardware group are added to ag->ab[] in PCI probe
> completion order (ab->device_id = ag->num_probed++), which is not
> stable across boots. The wiphy radio array is built from ag->ab[] and
> the wiphy device is taken from its first entry, so the wiphy sysfs
> path and the mapping of radio indices to bands change on every boot.
> 
> Persisted wireless configurations reference radios by index (e.g.
> OpenWrt/hostapd "radio0"), so such a configuration attaches to a
> random band at each boot. This affects any multi-chip group with
> single-band radios, e.g. TP-Link Archer BE800 (three QCN9274/QCN9224
> radios in one group).
> 
> Store each ab in ag->ab[] at its wsi_info.index, which is derived from
> the device tree WSI ring and is therefore deterministic.
> ag->num_probed remains the group device counter. The unassign path is
> unchanged, it already indexes ag->ab[] by ab->device_id.
> 
> Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
> Cc: stable@vger.kernel.org # 6.14+
> Signed-off-by: Benoit Masson <yahoo@perenite.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

