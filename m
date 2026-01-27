Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2926D2FED4
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 18:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ixa2UGNOFQZl7W2RGTX0PTppeOqrnnMpuO5g8Z9i7aM=; b=IA0i1Ezaghp7eCQpeTYrUXlD9a
	A9Ay7FBjyLCyet8t6Bi85KVGaHjzFEmJOga5JxRVL9uzbYLH3+mmfb/EhIFC1DXP++uR+VCnzZoQp
	jpf1Q44qEfRqVCegQFGmemv1eKmud7RBnRLwhKiXIrD3q0kIZHqyII7KeP5Qm1VR9fADgLVHceBrl
	lZrC4aNAla8Z2SmlaqkfnmuzE5OjvcFOuCPy03p4NtRsQG+M8kD5zeRnpw49xRmUmww3OCGGgJpFZ
	C2vWF/T2OxXsidVTYp1NYPMXAeYmpW28mRTGbJnIq9fSPCYiMLePpjbbHI432kIRrI/DqeDvAwyZw
	RtuOXkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknvQ-0000000EpKw-1Y5Y;
	Tue, 27 Jan 2026 18:36:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknvJ-0000000EpJ3-3viI
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 18:36:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RHhSnx2476732
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 18:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ixa2UGNOFQZl7W2RGTX0PTpp
	eOqrnnMpuO5g8Z9i7aM=; b=fcl/VH3HO+yP94XAfGovsWpacnxdbhM9txSHE4yC
	9goskpflG6mtq3dkXu18L2niM28yWp4YfCHMktg3PcvCjYDFlB3r26lykEscqVJS
	+gmwNXcIPSnFe11tvCEMqR9ulpD/f4/kaIJIS/ymZh1EL6tpt3iijR54o1p5NVOx
	4QmwJd3+vZ1rLTxeYk4Yt3jYQuC6G27WjmLU4DRHjuEjxWOC6Zi5XeMhN5mHdF9E
	XzhyRe9VAN6KkyADozZfiTMUvHq9sR7vu3L/ibvhTrK3jWuPyiwGFjGDPOmvLZZs
	moZwT7rD1jRxWYK49qRCh3OWywvBqzngqz4mwhVcphmolg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y06fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 18:36:21 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9483af29f38so5606264241.2
        for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 10:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769538980; x=1770143780; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ixa2UGNOFQZl7W2RGTX0PTppeOqrnnMpuO5g8Z9i7aM=;
        b=PEqFdXA5EnqjTzoBHFv8VP3YPcXNlY5GwcBj12YTEYduilUWB1Cg+QbxCNpC/t/YP/
         dnRBVP59Zrf2gTUNqzBlUSpKxkbKKWmXJYulhdsBhSy07oWHMvAUtk1JyP/ca54CuOk2
         j/kmOI2xTz8+aR9MMuVcJMVRjV/p22uUpELOfpDmK7yvvHFd4aOgV9inK11WrYaHKfTZ
         I8Ob0ej760P9xVxdbbKYu9GHnBvLMxo0v4eUwj1qwc0PPjhDKVgrWrjY3n4d5wYvmSI6
         1JPhP2GB/mfaHftJuCM5wyWu2AN3YBG7VouKLPeTe3Zc2Z9SJ6U9O2jJYS5+oCqKdka0
         LTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538980; x=1770143780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ixa2UGNOFQZl7W2RGTX0PTppeOqrnnMpuO5g8Z9i7aM=;
        b=AzWFzgiGaP4TsSBhc074n+vXYVzyD51MwgYagUyvJOOBruINFwJCuJDMlCS9pIrXFm
         L9jiz3OSft23pgJ/RKClNGndUjr5BpZxR/wdOd5cUO5zR/CbFHHAzPZ822OIqffmnQUA
         AVB/Yp8bmQ+xxHxjbtzoGOUmMwb3JStOWiitG0Dl/5JqP4q4rEdh5vpPWJFCf6MeIWMp
         Dd+iAJV4+8KX0YY9CtRSoBkEcnyYQAr2iNA0g7CVRVUoidB7N8Km9sqvL8F9CBNDUwyx
         6NamIR2d6KL73Xe6ZrxvHc+z9JUPtcjG3/OBBPHGdzeLMokKA6cD65B2PjZAVAy0wZJS
         d6kA==
X-Forwarded-Encrypted: i=1; AJvYcCUTstXzw22o10hHxJazuL7Jomulqp6ElyhCipJtoQGWw67G9iNDyomqK0g8PhwDFMUx201rT9Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqhCCy5VHpIoZBYngrvBE/GaUxTiUXsdOn+u9TKd3NucY/Sfe8
	jwtABpyCARhZTaruLSgTOFCxqcXSQhkfNlJ63Lg3RVrLc+x14zqW84362lSG4gXIkcL0h5ZuheE
	d6WuxsyOalPgXEpjbXPPF8p+pG7d5v7WeA3+gJk2Ef9RZ09JLkObwHXgp0T7B7zMIXkj0xQw6
X-Gm-Gg: AZuq6aI0r9o6dp0qYpzRKRYG8bRwpFTIx5s+aON8wotkXOhhcED801e0XXNLfg8iHzz
	1xILwZ42jko7DUc+74YMQS9Pl3UJYfkRUKhfPpig7fYe+dPAzuKU93cGA2cABqQGFmk6MoAO38u
	uqxW/pCN9SL+uPWZM7UXSPP4TDaXTFY7PCmylt9zmNfW/+SuCHWC3dVZhwEX5rK717nw6uSu0Ou
	axNAMIsGTKX0Rol5Jy3EYbH6Xh1h48B1Bb9UeNfMy7Hc+6mtaL05s0/1UnlB0LtUUiTZiF9qExo
	YbvRNQorBTQ+ebJI3rCsTdmiiO2OaQ0KUS2rmSquH17h25j1Cdn60TRIDgwEaqImybTKP+dKqAi
	BVoOYVHbVYPjyRdRjeZTutHTzNX7GSFX2SCi7UmfkBbHr6DKynXgC+4h5aCmIZv2imP//nbIFnS
	oBtJzjXEVlfGJQaixD2cmzaWQ=
X-Received: by 2002:a05:6102:a47:b0:5e1:866c:4f8e with SMTP id ada2fe7eead31-5f723817ee1mr912475137.39.1769538979637;
        Tue, 27 Jan 2026 10:36:19 -0800 (PST)
X-Received: by 2002:a05:6102:a47:b0:5e1:866c:4f8e with SMTP id ada2fe7eead31-5f723817ee1mr912467137.39.1769538979095;
        Tue, 27 Jan 2026 10:36:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481b72sm98670e87.11.2026.01.27.10.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:36:18 -0800 (PST)
Date: Tue, 27 Jan 2026 20:36:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260127
Message-ID: <usrawtmodalbj4b4i22tk3hzgbrpt3gdbji4x7vfzdhp6qsb3g@rw2bl7jdnp22>
References: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lrGBiHMfClKxFJ8SlJT2maQdP9ih5VDW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1MSBTYWx0ZWRfXxzOvqIpEd7Mu
 IYQPB/O75UW9sUQy9dLTSDKHG7xe6ZWuumjhuSDvJZIdwZm4UgHpace6YEfEGHMg7A0etApN8XZ
 DH6wYdMwkM2PB9/fqdu7GiKSHuP/kV6tDpfvA+zi7BBU/yEMNy6qwhDvx5O3DfZuhFNy3iAxlHE
 ClZn/iUXioII59naQ5TGMI4d3Z2Vz4G72+IDpalrOrP8/pip5xW/BML76INa6YsMqaxePviiPbe
 CRuqXQ29pzxS3CbdHE55/8X+Zg6Wxhc5qh5Ek4+isTP8TCPHvooqi9LKWWkLsSvOj6wl7KaphIO
 uNv4P5EmV//OJ3oc36JzTZ+eAb+FE2x5aBNUvtDFCqNB5Auy1riN5aYhOTK0HXYMygH6Eu65xlS
 Bb7Qm66z3gI+qrmHLv7zHIq9JB2XYb0LwyH5XSGJq7SrZTSHbnwlo3h9XETGtLh/Vbu75P8JJT/
 OwFiYukc4k3K2RGEfgQ==
X-Proofpoint-GUID: lrGBiHMfClKxFJ8SlJT2maQdP9ih5VDW
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=697905a5 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Ic6Kjyy2t_iG7cYfer8A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_103623_798375_AEDFF577 
X-CRM114-Status: GOOD (  14.68  )
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

On Tue, Jan 27, 2026 at 10:04:46AM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k.
> 
> For ath11k update board files for QCA6698AQ/hw2.1 and WCN6855/hw2.0 to support:
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255

Don't we need the variant for this one? Otherwise it's too easy to clash
with another unprogrammed board.

> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
> 
> For ath12k update firmware for QCN9274/hw2.0.
> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
-- 
With best wishes
Dmitry

