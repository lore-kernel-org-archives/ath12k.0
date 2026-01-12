Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1BEC9EC9D
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BX0BHtmRDW6rztCGXnRYg6OAfxVv/bQjD6tj8Wxww+k=; b=Vr1xxesXsIzamENf2oT9XaEF/K
	9LdzOoteSSruAVtOiyYmQE12LahcAEYwGfzzSsYA4B90+Hf86/Zy0w7wKEjZ8XZVQa2chAxFBqCQN
	e+US7eD270+vZIqcyXptI/1ZCtt3nLh8HdOoYNbGj0f5MX7oKUAt2HD+Eya3QI0RI7D93Q+N/oC2o
	GLBbB58wfGyy82gB6LpQ8HPF7L/DqaDMuM5c6CZZPJH+cOouPVeEMJ8lOVo4rhWzHGRemuLf+lv3z
	c/ziPYgoxX1hxdX8FDD4SKctmzoRbaXtQp/rUa55uUlj7pcCsHak1HmEX+5iXd8SvZBXGhVMQZBcV
	VpUp7VlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKm6-00000005ita-1lbH;
	Mon, 12 Jan 2026 16:28:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKm3-00000005isq-1Pl5
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 16:28:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEWlx1315821
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 16:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BX0BHtmRDW6rztCGXnRYg6OAfxVv/bQjD6tj8Wxww+k=; b=hTxg1/IGiLhOH1MO
	e4NuZjLAEYcuk8/TCLfZNhKC3ZdoJ/V8NyBgWB25TylHSRfoqRmarSG4Vg2/14UA
	3PrK+aeyqYfUd3sqKtgtzr9orIrNSEVEX2fgHmdiyDKVNKIXqSdd85a2MeQGTbAs
	w2qeIQaNqD8VLymUzHUU8cNOn4AM33tPMB0epsD3k+691/KajKYhbwqc/wF8r7nH
	in8Q8Uulj6zYMwMRT0xjGSCGLEgmG5lqJo6IjCOq2Dx5Tc1NdjF4N6/BIEWhunEY
	oZN3kWz8RVeNMyy8INl/CU0XYqOHBWc6zA0sj4zrgAM3H8wNS4gPVH22lJDR79+X
	gcfinw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hh3ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 16:28:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ae546fa935so8304640eec.1
        for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 08:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768235289; x=1768840089; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BX0BHtmRDW6rztCGXnRYg6OAfxVv/bQjD6tj8Wxww+k=;
        b=f2O8kZd+YPJvpSELzE3VMleCQw2sW3i2y2TPOXkzLdA+FHWmc7lWmT9NqwerMcaTNI
         lOLOo0swuRVsnn2CONaQs8ZmJSjscmE/GS+wS+VIpvkG5tpGWtPCwTNYrVgqo2epfa6J
         Ys0jrLnhpiwJCKtD0T75L6Tp0asm/DX3rfnlr2/dQvSie0vOLyfsDFW6w1trZ6VWv7M1
         p/liPHid1Mdet6Rwgzvac8RC7ajaBjJKxUcDOGMNdMmbJAk0Tv2Fd8oYa5MEZ6OzqY1Q
         LPsa15lHrslOo8KOebvQnKznRoAoYGjXRF6DCgaik8jiHvUnvJnR3LT2GqMKz8RYFpNF
         mb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235289; x=1768840089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BX0BHtmRDW6rztCGXnRYg6OAfxVv/bQjD6tj8Wxww+k=;
        b=JENTLSsz26qwgYpSt3Nzk4CBnIgT15bfBKjoIgGu74A0hCMaI4plKT3gU1H7vtZO/a
         B7jgwcGcfLpDMYTh3Ko1AytU2MmGvVL5VShmc20Tgrb2WZJV4t6uFjLqnZKlF47Y/9N2
         X/RelOr1ntj/1oBB1bw+LwwwDAO6ghte+mi/WBSAs8AFi47r1nW3pTznTLbTP2pftMbH
         lV+vEvaYyFBziv/UwQ1YgGYQ5tN7iy3HFasBDryJUSogBBS1UAkHQOPdtRypUHdSy1aY
         gqUEDhdkVV62yjEIAiuChIPnIGS9zodCZ823G7+pLZxXb5AG94Q1XbaxRXiZ+GMD5puA
         6u9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfRwtVAH93W9VvNWq9TPD+wrvTKCtT0dcW297dIOrnt1Cv5qbZQz85Ffz2dHtSa3hlPZmT3qw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUQDqHmwhnP4xv1tsdSnl73Q1ZLQOaAuEf8SSyakVPQBzifQLU
	ePZ98zmldgbwS0Y/azRjLtdSa/KiKSyXCnim2VHP/eHSZ79LcD5YQZd8ejFmLloG1W3+FiuYISv
	aOOnsuLy/GrXlRin3NB8fR6cE23g3pfgC1c0PMMCPAUy10iHVSd1CjsbioOntH4Pk3POiIsQn
X-Gm-Gg: AY/fxX6BDZ9gEATSy3qKI2lCnqij5yroCoP8wfmzozDCBgOvIhviV8NU5s37KtJbqhH
	SUZqzEqiZrDyUO0SRXa/WjHjwDca8V+Xy6XGgpaHEIvfFvZsSgdomr665VJyH2u6XsJjRPfeB3o
	gB5sN9hTB3n8tZQDwFRcvQzt4fG7LsYgkMh+E8dz+qL13wlVNOtqWFl9ES7A/nM2T60GyYY8twe
	JdO+nJLU2MnNpS3wpje3lhTq8u72dhyvtFwgA0DMOiTW/IS+8zZoOHFtYHazi1bub9jTvjoMMWv
	RoZX+Sra/M1vpxlvsXTQmL2nf9a5vXORCW987y07Rdvdmy7eQj9JSlOP5C4QLmZaVdrHxaV3Ipr
	WCvyKZ3pnqNF/lMLYSSv7HvCvCJBvteGA7Rc/TYc+u9cGen2bqgO+24Ddf3RtzOtqlbOwbQ==
X-Received: by 2002:a05:7300:7f95:b0:2a4:3593:645b with SMTP id 5a478bee46e88-2b17d240ademr13189300eec.11.1768235288662;
        Mon, 12 Jan 2026 08:28:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfcGESqLNsZnOeosBVtptLRCe98PHkvfgJ884r3P6qPgQRtxkDjAcEG2KkohFTH8/AkAnuRg==
X-Received: by 2002:a05:7300:7f95:b0:2a4:3593:645b with SMTP id 5a478bee46e88-2b17d240ademr13189289eec.11.1768235288046;
        Mon, 12 Jan 2026 08:28:08 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm16565972eec.2.2026.01.12.08.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 08:28:07 -0800 (PST)
Message-ID: <557ad1cc-b939-4a7f-99ea-336acc1bc893@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 08:28:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: cancel scan only on active scan
 vdev
To: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260107-scan_vdev-v1-1-b600aedc645a@qti.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260107-scan_vdev-v1-1-b600aedc645a@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rxfE66RwnPA2JRTsgCALplVJyC2KqEpx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDEzNCBTYWx0ZWRfX/1RNV6jtutRx
 6xnjU2qX9a3jPuLfgj+U55wp0sFIsa4t0R3BLPv77If7AGBq6Gc9QHsMtiMlU+x0dgkVzr4SoML
 myOcveucUZh0ocdzAVZ0B2y3yYxyqn4Ji/DL8t/swpcDnwyF0+sT/gpOAUOj8aBF4DLAXPoaJ1d
 g/detvQfhyujLbRqozI5ze/3vjzDWvFbivLqJ8JT7JZ1is4IXU0CMzezeWUd2Sw09qRL4uIBHhw
 zw0A2RPwGHf9CWVsOEaXYCEUSpCGvQUzKuot/C+0B2mr2MJOoOXeUywygEUk3kY5trFSGiBnwC8
 LVtEN6DasObDPI3ouplMThNhCGINTaPK8qzUobFzcNSm+AJWBEvDVHWCpuDveX9oEX2f+77rffM
 8ufuBEfDo9apAxUerVx6cmL7QeBSquRF36j5QPItGzJdjg4nA7BikPPuAPncKXPWYdgZ160cogx
 C0qP5tkkumD7Gh5P5kA==
X-Proofpoint-ORIG-GUID: rxfE66RwnPA2JRTsgCALplVJyC2KqEpx
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=69652119 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iFBeAqSSch97oa6bARUA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_05,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_082811_456502_DDC21CFF 
X-CRM114-Status: GOOD (  16.77  )
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

On 1/6/2026 10:02 PM, Manish Dharanenthiran wrote:
> Cancel the scheduled scan request only on the vdev that has an active
> scan running. Currently, ahvif->links_map is used to obtain the links,
> but this includes links for which no scan is scheduled. In failure cases
> where the scan fails due to an invalid channel definition, other links
> which are not yet brought up (vdev not created) may also be accessed,
> leading to the following trace:
> 
> Unable to handle kernel paging request at virtual address 0000000000004c8c
> pc : _raw_spin_lock_bh+0x1c/0x54
> lr : ath12k_scan_abort+0x20/0xc8 [ath12k]
> 
> Call trace:
>  _raw_spin_lock_bh+0x1c/0x54 (P)
>  ath12k_mac_op_cancel_hw_scan+0xac/0xc4 [ath12k]
>  ieee80211_scan_cancel+0xcc/0x12c [mac80211]
>  ieee80211_do_stop+0x6c4/0x7a8 [mac80211]
>  ieee80211_stop+0x60/0xd8 [mac80211]
> 
> Skip links that are not created or are not the current scan vdev. This
> ensures only the scan for the matching links is aborted and avoids
> aborting unrelated links during cancellation, thus aligning with how
> start/cleanup manage ar->scan.arvif.
> 
> Also, remove the redundant arvif->is_started check from
> ath12k_mac_op_cancel_hw_scan() that was introduced in commit 3863f014ad23
> ("wifi: ath12k: symmetrize scan vdev creation and deletion during HW
> scan") to avoid deleting the scan interface if the scan is triggered on
> the existing AP vdev as this use case is already handled in
> ath12k_scan_vdev_clean_work().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: feed05f1526e ("wifi: ath12k: Split scan request for split band device")
> Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>

Since this fixes an issue in released kernels I'm taking this through the
ath-current branch.

/jeff

