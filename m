Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477B1C43458
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 07:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLjqNjE91E9tE38yfvP00apwIjFuHuQeDSgtrb+rTTw=; b=jf/hZftUCBQHhGNQ34B+8umsUw
	obYfv5i2cJ3HkO1DCzyzgFlTZEStI/2FmZcb/cferKQOzBvIlizExNjGPd2QyhnLT1dwmcc6KDlxX
	L+oNQ9+yhOb1hSf/lgfbaM8w/x4oHRseoec3Yy9gKQ1CHLD/FQeXAr2jSLk6N0maZdQKQkXNYSKFo
	3b1mn6bAhjYVsj/29JYj9FHsB4w+WlZ90Jl8UdXjY4you7dqODTHzoCws+v9JDhKvMIwdNq6fjkBP
	HAjk+fKI7k/STb+qbNDMf9njZhgeXs8M1nlcLIo9lzAkX8GnvQMXF0LGPCTDgaRetDrYoxMcpXvj9
	BMBHup4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXvh-00000006Eak-4BVd;
	Fri, 03 Jul 2026 07:03:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXve-00000006Ea2-3v1F
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 07:03:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rwqt3126426
	for <ath12k@lists.infradead.org>; Fri, 3 Jul 2026 07:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xLjqNjE91E9tE38yfvP00apwIjFuHuQeDSgtrb+rTTw=; b=LAg++SWTpblLbrBA
	SIcv8/z77S0AxnOGptOBEiUPuGfIxkfJ8sJRHSlc1zfxf3vYh1U0oFZDAWaKnUAQ
	sTTdLXPTlFYnDAdGdH9qG0u+oJXsy6YL9q4OfyEqyvJoPpdJiTr9zBGA6JyY1gAH
	v8Jx/x6OoeI8mxWUu3P8C4TriGxaf9HYuWtCT/Km1Bwrnp1mIHDwALB0iARtZd7+
	LQ0/E6H/Gw+LDK30Tl9MHMDUTUaxEr+0I8Lv8Tffmy2r9Pa5fihyuF4hqjyUZDlx
	IVDZpJIAQd30jsViErpuQZYizSNI8yo6NkhJEQUeg6wv6UVBFobPDY0uVGaPSOFl
	3ErZfA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnk7an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 07:03:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a298cd62so325980a12.0
        for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 00:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062193; x=1783666993; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xLjqNjE91E9tE38yfvP00apwIjFuHuQeDSgtrb+rTTw=;
        b=O65FchITxSQ0bizA8QJfcavi8eDoM/Qk1X/ZFlM+KAq9oH/SiQ7e1bc6B7vLC72QAC
         pC0PX4DXbhOCD5HaQm6N+h+/RRyITHfVUtHkYYOoGfBHheubSrz4EbE1wnBM5NVivq6e
         QCzxntAvsJqIzfsnASzyD0zzt6MCgn9XF2aJYehyJ1AbA+HGkGdO4GZ4WozIp/SAJVQ2
         wMd2R+fMbrliuRQjcAO5VMLw/seMewOmj6tyUljtDhE+iJb1JBaKbENoQD/Mla4I/n7h
         U4Pomw0zFFguzRA2HNkDrk9zZTtB0Ri2fXxKZzIC5xRrl6raNj60m8jatQwQmQUdjycB
         F3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062193; x=1783666993;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLjqNjE91E9tE38yfvP00apwIjFuHuQeDSgtrb+rTTw=;
        b=pgkzpVmFSkGmKekb6At1tht/sGhYOr9eUESHfLP1td943eIE3Tc8c12HLoaIpUZNFV
         0cSHbMVF6HjeAh6lB12z5LFhg55qc257L57fdmpE5gDDmGwtQRLnHU+UJUMBgF/1fknd
         b5P6VGiO+hqOC7N80kzpw91kkC86j4uGkcBkV9EgHCPeftsSC3QKfz2vSCFGt0K1CwWd
         p4s8nPrxhb/HNZ0diAnuKlfXpmf+xqMftgPLaScYTvmU90aFdq06L1IPqSqfi8Ah4Uyh
         19IgZfofULG/ntmIO+jIXbd+AAHR/jRQG8BrUCEtZTlrFIgT29G6shK+m6Z3W4O6t9KX
         HltQ==
X-Forwarded-Encrypted: i=1; AFNElJ//+jAqDQ0Miixgsyf1CBi9b6NWC1tXfhCgI+GR2ey+mT4+7Riws/WNPEZZKBGIZDlMjc8Wc+g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOTBHxIK+hQLHLeup5JCEZgFvnYt/BHCtrDjKy2mcqPl7XOmqh
	X4OjK9/cUTr+yzgSjPICxqjXhxETGYYqHU6w4zViHZTf/JSexUVT67cWF7HmCnkSI83hvCMr7e4
	0C6XiymEfHrnDTveQSfhDojzYMu98s03aXP/WLOj5CZP+V/78KsF2n/ZMH7T3V8Belp7jPxPc
X-Gm-Gg: AfdE7cl7mA5AeZT4dN+E8+Smw4prY9iOjsvKTlQj+fDS69bT0+To/yOKy0qRyLnVGPR
	gqBk448YG7zN4FcEkkm7MXNSZtfucbFT59eBhTxeSVcgA3cvU18NQHA2TUPY9/TM7CMOxD4GENN
	xnxnK+SzElapoC0jF/Qpw51prh4j6AoMZuV+wbJKYssYhhCJo0ywYvvzW6guX1j4btBgoDAvKZn
	3P9mDgl5R3g3pbc7DGIPe2BrXga5zfq6VDFUge73oH7/Iy5yTaZPMFQjE4GiIxy+GN2I+CR8Dy4
	ZktDrrE7NDKDySJ+aWU80IRGuWGd8OgLMLhn+Sc4poK/bjtnJjmV9ybyoIMPYjhbJPJPos+5XcJ
	VPT6i1FK+azHF21/0WwCKfxznjCuVoO36SmYuJ2Jj7h/dB3hCU6MwtXdza2oZsvRcPBUca9ybvw
	ANP15Zrky9
X-Received: by 2002:a05:6a20:9187:b0:3bf:c126:bb02 with SMTP id adf61e73a8af0-3bfed4818b7mr10616375637.47.1783062192656;
        Fri, 03 Jul 2026 00:03:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:9187:b0:3bf:c126:bb02 with SMTP id adf61e73a8af0-3bfed4818b7mr10616339637.47.1783062192136;
        Fri, 03 Jul 2026 00:03:12 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e921d28d9sm2139230a12.24.2026.07.03.00.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:03:11 -0700 (PDT)
Message-ID: <d492b10a-7445-48df-b752-726e5c02f5be@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:03:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: Flush the posted write after writing to
 PCIE_SOC_GLOBAL_RESET
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xUWeUlS7Oc7K8E0E5xZd0aJSD6XuNeg7
X-Proofpoint-ORIG-GUID: xUWeUlS7Oc7K8E0E5xZd0aJSD6XuNeg7
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a475eb1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=fjTVS2QutaehiSyZ5pEA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NSBTYWx0ZWRfX04FPGDythrB3
 nrmeLK/otETRNMb3WyStXvEt9aXEZ5pxYkpafyK/NBWIqTi37pOxDDsM3v4gc9St8VOxvWDUVOQ
 UKpbcLXJBvEL0jZd+dp0IPpneKG0Tfs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NSBTYWx0ZWRfX3WIhPSfRglpp
 IRDitElOxlTKKDQ1JZMkduXQTHE4AzKfMWUNbzadk4jdcszaEgaaaI7N4YY81OXz95/6wjQFL12
 uqu7kgPHHBadD/h6fouUar2B8n8kik7pAbB+RZi5a6VOv25cKFZsFc95NQhoF4SiIZVgF394vS2
 VYajKl700D9H1939asLZ0h2JMptpyljT1RptEDSci6uYPwHeWwIOwOHC5lixiVjTthkdWfpmYC5
 +/fqrH/1I1CIyE911/hxf2GtHikZvsyK9wXHU86wlNVik+rjwvyu3G82chTQiBHFVV58XgVd9MV
 bdCANTc+JOBoSniDeYRRO6oNWdArA+2CZN7qC3CHv5rhtAC3k3rHNembpiXk6Gw7SJpu4AosO9l
 805Ki1GAH0vMCSlRa1kmQP2hJNEKqlY4dc+SlWJ7VfxXDPUjUdNfTSbjxZB4vn+xr/vB5Pj7aVi
 eNzNo8DYmURBIGDv4Ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_000315_083024_898BEAD0 
X-CRM114-Status: GOOD (  11.17  )
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



On 6/23/2026 10:16 PM, Manivannan Sadhasivam wrote:
> ath11k_pci_soc_global_reset() tries to reset the device by writing to the
> PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
> that the write gets flushed to the device before the delay.
> 
> This may lead to the delay on the host to be insufficient, if the posted
> write doesn't reach the device before the delay.
> 
> So add a read-back after writing to the PCIE_SOC_GLOBAL_RESET register and
> before the delay.
> 
> Compile tested only.
> 
> Fixes: f3c603d412b3 ("ath11k: reset MHI during power down and power up")
> Reported-by: Alex Williamson <alex@shazbot.org>
> Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

