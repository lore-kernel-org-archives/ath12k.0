Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394A4C98308
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 15:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=; b=l2WqiDiNoBXCe3Qs/7kGD5rixh
	cJjgz6dGLj0XKs1TEP5C+Ems9+2IjBqOfwyDFjakEozXDBHx+wvCRithfEY6tbAmo9hAPo4GKPdWY
	X+EbZb2uYIYWINES7/YysGXyiUYUxMBbfGWTxug27Nssai7ciXX6wV7l2W2/1NgOPVunYu1CURQOv
	yTaMGzufsd5BaCdV9q/EWvxpCVrC8qcs8sUqK7pSqp3JBbdoo1U66Yn/Wdwmgv4K75Z9EIGO3J49Q
	XNucSYxPCnph7NlG4ehm8TPx+c9cR8yAjZOpluiVzxxP4dm9NeTD8GEVUfSVlb4iIhd7E5epwNWWu
	Z5CU6BAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92nt-00000005x05-3lpx;
	Tue, 22 Sep 2026 15:53:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92nr-00000005wyK-0Ubk
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 15:53:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjNAj573562
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 15:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=; b=eghf+xvy//ZOFslf
	UpveaGSVcYErvpNTp5T2vvsCG2NizpveWEYt4+MVh1sZFUIW2iXMDf2koLfzGvxw
	Fpm69AfvdrlllS+wklhM0clBw+kQXpvQfbFtAvmsRVD1aNFxJWJ9qVWsxQyRtgSF
	BXGKQlyBgfpBKL+27SAXmqIVl8sfhVa61k0bcIwLQUIdY1BfPxh68UiWB3ECDcvo
	F0ilmftXrHMrJtzTwfS8kH2Gl7yavjz7AEzq2JZ7+zalAxWcEIekePOf6j9vx4Wq
	ikbaCulpsDs8oJ4QUgeWcwrNt7hFwyzK9Q8/Byr8KrL1EiYErSIv2+l2I0RY9ySQ
	WWcGMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkjax2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 15:53:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3734d06dso73423385ad.0
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 08:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092385; x=1790697185; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=;
        b=UGLgcr6676ZLxr8xEIZdHPTBOD5x6VbECYtMXUBm4V5LFo7bDrkUYnMNOT5KOgEiNf
         TG/Ff0sznvlyMcvDMIwnahBejABr+ecmVNQXAns7D/+zEcYR1n4pIGdpRW/8m06pFpQe
         X95U1lmAAL/8umoE8Z/jJ3+fRyUojQ5gG/LgE3YISh9TwO/UnmZZyTlyi9X8CcQ6+tNJ
         eJ1Lh2PBNKnyDn0TAVK/q9vN4Urer7EnbBfhbM0aDvH3Siy5VFQWrI6FQdU7v8LA9bae
         ZnYM8nyMv+oAEBUSPKQ7MPKEJrNeYFrytMbVr/EAn/6mTayHbu88WeMGY3Txg84j0zrz
         7dYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092385; x=1790697185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=;
        b=cZMNzmKsFvmEV39hwXoYHf2O3zYI8kI2i+EHMCkfJx2vSqyXDBn1lrgN0rFn3aygMt
         JYMSD2Rwv4GScBg51X/rzIDkhnsmyLSjN1L2JbeVNI8pFXP21h/gApt/rx/RSmw4sK8L
         kkUSmE/zCCWMPiCY6dPMeQIzRCN0ZGPOX+zr8224Vj5eUWanwm9knniqnrDhlNMMPknO
         lT+hGRAGT0oWQC/NQ66joN7ocYtBZE+vBRsU/WjGDzPsdtcSxuPN/TMwly2GZqPSL2LE
         ZJGX/Iheh4cSYliIIkobRIsL061QeVuEuXlwMh4Xk4NTzTKJimYBLf0A34Sh9wLjRUoj
         Y+ug==
X-Forwarded-Encrypted: i=1; AKwUvByFDLjAv7bbW9psS+w/b0k/9DP7wEkVhdDZT2iwZzNj8i/NV2zujlhwF3UOPK+sBSX8dmJ4ZUY=@lists.infradead.org
X-Gm-Message-State: AFuF++ljvjbOwIUjQerxPF9UqtomXCruQcySHt1sgRoAuzTEQXAyqb/F
	BOJBWmIoIdWP2TUKIINPC23gq1q5XsVNJwLSUYbQ//fblpZt9JaCa7WB+eOLXQE5A450U0bsG7N
	rKrr7kbxWNLo0npsfe/WRs8s1W4Q3196Q5eHwXbXiV6bcAapeJPv6be5Sy7O+O8M3
X-Gm-Gg: AYBFou3I0HihovyPshbSUdBhxJVjeeG/YKvOXvF0EVT6ISP5ccjGE7xh3c7ThmDMuyJ
	Vw2gPkXVNu8XTrDInz52ShHRSSm2K+jDT7G/sPrkVtyyxka1NqkZixNwliV1bjkhmE4jJW10guE
	dpVhkCpB+/DQqxbqBmn0/RP5RRN7EksKkk43dbCWfjZGlo69dPITeXEbT4NkaY2ReK6LX70x7FT
	WRcoQvKZN029naLtBD5QvAFOKZX98NPL+JyYXi/fvRFFLdcBt3GwAp8tGIofeCW+gcCSAxFgGC2
	KGwCbAK5r5Ahz+KKZ9fVggNouslexmZ4g36C4iV+k3Ie+AcTL6SSlp5l6xa09RbSKo+mFJe6qqY
	DkciLg2Z2xiWdMHsxIM1y1vk1B1mX
X-Received: by 2002:a17:902:ce8a:b0:2df:3b08:a30d with SMTP id d9443c01a7336-2df60b60b5bmr20251545ad.43.1790092384961;
        Tue, 22 Sep 2026 08:53:04 -0700 (PDT)
X-Received: by 2002:a17:902:ce8a:b0:2df:3b08:a30d with SMTP id d9443c01a7336-2df60b60b5bmr20250935ad.43.1790092384329;
        Tue, 22 Sep 2026 08:53:04 -0700 (PDT)
Received: from [192.168.29.33] ([49.37.212.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d02f7e1sm13009205ad.39.2026.09.22.08.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:53:03 -0700 (PDT)
Message-ID: <f8f231b6-a4fb-4f19-9ec2-949668bfd5b7@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 21:22:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] wifi: ath12k: Connect to the QMI server belonging
 to the device owned by this driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-4-c00831e88957@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <20260922-qrtr-multi-ep-v3-4-c00831e88957@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YZOx5y_xwZQSpgeV_XZg0FMwG6LlT_89
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX0/3VP4ISyGhA
 1GO/BWFIdEx9XLuXs5uAasDWYgSRZq02fCjTQKD/u21s2jkBgaQ6bfMUygIw6XVEfCjPQ+cCvqW
 54gFRLoiBxy4rqid8Ct4UnZgHq079VQW090KnFukWKsGwbuh/c7UfC01vf0LWvMLyhRAkxAl7oQ
 b/Pdog4U88YZEJQaYT9AbZy8UC/hFxhWkB9Uam+Uaf0s6UDnYTHUx43blvtfHdAYCbPOut6eYZ3
 1IgpqVoFw+hCI3hl6qNFH6G4OHof1GG+aP4mGO80XhzMOFwyqEgTeFT9JZfNKrv0uUqbHLpSlcP
 MPKyUycAYC+KL3numGspCvgDZCZ0PANMqi3VyDUxA0FDQiD+pVyRRyH0eTNH8ZnIVXFjr8nW1C4
 p2hi7D11l39GF4A/k1ktfqRV3X+fWwMI5wjhuPvfqhwhclTfyq5mM5eil1Ql7UdUUA60DsCZO7S
 F46LTueFIVuwbxENxPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX43yHO9ITitOa
 dFroTkjsPZEzn2eEx8Y7X545cmcPBXQt+u/mUpiZcgXDvKAspMWIASYEjftDLDZB78JiK7uo2P5
 ZrDlsdAoYgeSIWirswUG27eOMBhLCQE=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab2a461 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fVbWt6ZMyMsyUNhTwytWAg==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=R4z_reooDQMcG2LTbH8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YZOx5y_xwZQSpgeV_XZg0FMwG6LlT_89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_085307_185805_6A9E422A 
X-CRM114-Status: GOOD (  15.66  )
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

On 22-09-2026 19:11, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath12k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.
> 
> Tested-on: 2x WCN7850 hw2.0 WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> Tested-on: 1x WCN6855 ath11k + 1x WCN7850 ath12k
> 
> Tested-by: Juha-Matti Tilli<juha-matti.tilli@iki.fi>
> Reviewed-by: Vasanthakumar Thiagarajan<vasanthakumar.thiagarajan@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

Validated in ipq9574-rdp433 with three QCN9274 PCIe devices.

