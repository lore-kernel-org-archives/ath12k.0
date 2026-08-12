Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB53C5B572
	for <ath12k@archiver.kernel.org>; Wed, 12 Aug 2026 02:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+p2VqFnG+b4Yjdtv9vxJ3+xVa26z7klBBHVeltHih4=; b=WYkpeov1CR7Lnj8V0R0VX3Xzks
	zsr8PErRd5C7qnNJRFI2u4gJ47v0WdJwDojITNo6ty5TgYVouk172RUoMDI4QaZRhCg0Fy0ix5wpC
	uX4YXyK9AqP56Q9E8RMgBLwEUWrINeK3cKyfRHKJfe22NsyF3DOMm2OY8TGmUEARroh7INojbbj89
	EUhCdf9t8QV8uLPYFvgLkumGDsw3XQTH4MPuywGPjpY1nUwTIffsy40wE/v6nvo6baE3jpuUcgaZT
	m092M9KyxlSvlOXW54zVEJhnJ/PLI57dBHvgZZNbr1BQtyAe7odABiPDDPXDrLbxQSGzaDOdBydrb
	ropWxdbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyK8-0000000FFU4-2Tg4;
	Wed, 12 Aug 2026 02:04:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyK3-0000000FFTh-405o
	for ath12k@lists.infradead.org;
	Wed, 12 Aug 2026 02:04:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BNGhcK2106923
	for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 02:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+p2VqFnG+b4Yjdtv9vxJ3+xVa26z7klBBHVeltHih4=; b=QWLjisjyPMYvjo1f
	ZwOddq1kzkbhj4HR5Wsblc3FPk+kSY7gY/temW+jBeEX5eSdx6/uonB8fWR41yuX
	mLPR5b3SiSYc3Ao45vgisf9iVz6zTvLjlDb+wasrWnuJcd6qXFoSjVr8ptPy1k/a
	spufAuaigoKRkKZNL15uEglZL9QT80KE2fNxK59uj51mLSDfbighiHdkHsHRL4iJ
	4kzWWkqZm5PDSmF7p53N9ip7zkE6k1iG0dPPBdG6i5yVwDT0hIxh5qIxMDVw2DgS
	Lxe/BNdO4gxCypiGvMSTkUGbDAlMZ1rZTRie1GkMk0oJ2o1AmGF0+TSgOHyN1qhb
	F7JoOw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049djyg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 02:04:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cceabd70f5so14251145ad.1
        for <ath12k@lists.infradead.org>; Tue, 11 Aug 2026 19:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786500243; x=1787105043; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+p2VqFnG+b4Yjdtv9vxJ3+xVa26z7klBBHVeltHih4=;
        b=UKrk/rJX3MK0BpKMCDG931dCcLJYKeNQ/kaAKiDrM06QvZ3j0dYikqt2epQjR7JsMp
         MxmzYe9743s0SnEEhWzF/bKmA+d7z/58F/VptqCurO1Idd6ur2ZI/1qUrlbRFOy65U3M
         hDCEzs5L6R3dPH97Mv2iAvlEsTcXgehK/n7UY+XdNpblsnn6pOiQG/XXlBxHQ9JaZVaH
         QjIv1SsOVu2XxkIm+DBdL9ckLnFiFt3zIYqtfAs1U6cG+MYr7iPPRP6odjlCyWTk/jUw
         btmz58dFzLAStZqD3aNIbWCFETniMLvYgnh3626sZVOIZuYpjZjJFkhb9Js9CRs5Gl9O
         UM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786500243; x=1787105043;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+p2VqFnG+b4Yjdtv9vxJ3+xVa26z7klBBHVeltHih4=;
        b=QBi/Y+O2Q4HJXPsrAsMDzh3vd6wfzIPqrAfoyHw9LAx1s6kIVLVWAt0aOFVVdpmfCf
         nJ7hPn+WvQbyO7XUl+6vVcNMzr97UD49bbRlEikQW8tAm49uSLOtPVwRcHeOEqP7xTjf
         i3dpUEL7W+UqcsY9VAQHWbQ50KWKQ8WUg2RQ4Aw8HWyye4bqgNn4bgSMnmmb7D2HjhU/
         G5c3e6CM9asuwV1mfodob9ceMP5C/ZT+D5VyaaYbffGDV+LWg8mOW7z1o5jGZosxH173
         e4KmD3ptxl3sXM7E9wzU111Ewb0GMNsjbOammXAlDqWV83HZ0vqgMKqtiIw5O2zI8yJS
         7vCg==
X-Forwarded-Encrypted: i=1; AHgh+RoiUIjuawF3obpt6+xYwRwf8F2ctH9NEfacNMGuZYrz/+wFv91BwKA0ZQQNXZh64UgPqDaqVeg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxA4usrE+hhvQEBjGzwwkaL5UmAqeXDMYbMvwlWArEjUd21T0oK
	csmQU3jjroI7p8q3godWoh4XAqovRehet0Un3x4cl6juzwnCJwgByO7sIzTOepX9Kd22EZkdNsT
	hAtWQ5U03DUVgqZ/7arCFVJIR6idreVEm6sAGzTVrruPDjs3tO3jh3VuHDiPvIfNI
X-Gm-Gg: AR+sD11kCX7rbkSapsZCnp2h0W4GfOL4DRVra326xNVlQ70Jezn9ffv9puYzWpKAgRZ
	laReb3/XVES9X/wSwuRD5l2VRVHtzHVFQOVH0sPLWpuoN3PKUKggU/apAaw2URKLcf3BU5fyDwa
	KoKH5nPtxxzwxKruPlw8RSN5pF6qK9P/ou+Nlk8opCJ34CXZySmmaxaPAlYcoWvO3q1bBKs4Sk/
	2Rf0OQTOvI1tjXE1t0X30FIsBi23aQIOIQC9tOKRKkD6aIhOmikXRxuTvZbztt1/SHrGkbkhz6w
	/vns0AeRSBk2GHRbuI6bDrou2czqezizSjgVDuX8wk+7ETcEzS5Pcc+v+mu6DUjGwmYDyOrx1DF
	BmI6Rk+Ujp2rsM9RnflhWhxIqWkuXKqIYRzXm078u4QBS5Dt06qwc3T1pioYYD4KnVRbxM7zX
X-Received: by 2002:a17:903:3c28:b0:2c8:1c05:16aa with SMTP id d9443c01a7336-2d34560cb74mr22408505ad.19.1786500242775;
        Tue, 11 Aug 2026 19:04:02 -0700 (PDT)
X-Received: by 2002:a17:903:3c28:b0:2c8:1c05:16aa with SMTP id d9443c01a7336-2d34560cb74mr22407915ad.19.1786500242305;
        Tue, 11 Aug 2026 19:04:02 -0700 (PDT)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d8e9sm366245ad.40.2026.08.11.19.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 19:04:01 -0700 (PDT)
Message-ID: <56f52bf5-e6ef-47de-974d-fabd24fb2329@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:03:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add support to load shared
 firmware on multiPD
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDAxMyBTYWx0ZWRfX//8kIgJVhkJX
 Hzc0YbWQzqK/J6e742+UgM1pxxEJES4qOCoT6kO9LT0iLzgdL1U1mARA4M9t4a1YKt1UA8CtbKQ
 L81YI11QMQ5+YtJYl+7zLN5NtUyE7uI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDAxMyBTYWx0ZWRfXxOZD5XQdCk/Z
 iEAy2kLINc4gVzJXTtxDhAPXMaT9y1sedt646mVAu9nTCwhoQOPs+YRMxm8OoW1aItZAWQrFQex
 MP7/SxslqnVRdgO1BwM9nGxlotsY6aNnceV3Os7hThdRT4uwNkjjMWOke5S53gvKimZa0SdOUF4
 PvgRu6qHeGoqh7gR6F1O2F7euDBUCacb0Y+HF88aHtlTdDO7Ax+GPe9nWbxQbTh9qulR6YJ9YBd
 lML5KNK04OZ0+LuF96t3KYLyId1K9BcgYlYy9LIldyZFdoaoPfEmDIAc+r9gfyjBh8Q31vYY4i8
 5jTio7P7R41r1uDjXvUz7E5LDFgkkgJQhycpePq8iSF1B7UhDQRwxNdmrc61WQb5ZzUt7UwqYeP
 4zqxSg2P4Xh9zFAkfcLzn7CWyAXA0Sp3U3XzuTfcU0DlUm6E7nqsskwjZ1PzwQZeKuw0O48yzf0
 VEIa3gaDhYCaaNywxEg==
X-Proofpoint-GUID: 2wbQeFnmGatbonVHjD3kVMARLya4WTJB
X-Authority-Analysis: v=2.4 cv=CbA4Irrl c=1 sm=1 tr=0 ts=6a7bd493 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_noMR-R8M9vqBXE3qqEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 2wbQeFnmGatbonVHjD3kVMARLya4WTJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_190404_667625_B7E7EE3E 
X-CRM114-Status: GOOD (  15.10  )
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



On 8/11/2026 1:43 PM, Aaradhana Sahu wrote:
> IPQ5332 platform uses a MultiPD architecture where multiple firmware
> instances share common read-only code segments. The driver currently
> loads only the per-UserPD firmware, which leaves the shared read-only
> firmware unloaded.
> 
> Add support for loading the shared read-only firmware once before the
> UserPDs are powered up. The shared segment contains common code that is
> identical across all UserPDs and reduces the total firmware memory
> requirement.
> 
> Store the reserved memory mapping in struct ath12k_ahb_rproc_info so it can
> be shared by all UserPDs and mapped only once. Keep the mapping valid
> across UserPD power cycles, and unmap it when the last UserPD is removed.
> 
> Shut down the shared firmware from the rproc deconfiguration path when the
> last UserPD is removed.
> 
> Also, pass NULL for the reloc_base parameter because the driver uses fixed
> memory regions configured through device tree and does not need the
> adjusted physical address after relocation.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

