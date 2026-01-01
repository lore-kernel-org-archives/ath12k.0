Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60E6EEE24B
	for <ath12k@archiver.kernel.org>; Thu,  1 Jan 2026 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ik6hlVXeTmBKrAB0aF6mx5+u5ON4Nq+bNmY4Sp4BCBg=; b=itz8U4zAKkfsrexPomZFtUq9KJ
	9v/jbd49ML74kDnj3ewUpR8VpCsB0r96AWkmwAmZ5thpBJO+yVyS9ZKW85125Si7H9Vwpiu1MH5ID
	eseqJCQr8V1pRt6YrQdbGrMtZ8+9VtpeyR/5HCGR+nuDsrk3sKwcAk/LTjVQhtwSSayvxM647icR0
	W/YsaxrwehmBQ89UNv1Oa99rO3kBQIPxOYz8FLZpQUR+KIJMznBozNzLigxZDrqdCmy0jFaCSiFGh
	hr/ompSSlASsYDN+f+g97AuQgCmhzcnO9pHaVU/nRWIAl/KZq5MbYLzYa1cJVIatleEU+SZQwaW2i
	UgwSf8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbNnR-00000007RTf-3muR;
	Thu, 01 Jan 2026 18:53:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbNnO-00000007RSt-1lt3
	for ath12k@lists.infradead.org;
	Thu, 01 Jan 2026 18:53:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601IXdTp1745026
	for <ath12k@lists.infradead.org>; Thu, 1 Jan 2026 18:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ik6hlVXeTmBKrAB0aF6mx5+u
	5ON4Nq+bNmY4Sp4BCBg=; b=E4JOakQbeHUd6cX0TJKs3SQDrGS3pN2GXE+/B77s
	INRK2xConOMgsCZKtMw8/fZXSNHbErDJWHW4Kbo60eBISTJCQ9lIDk28sOEZTRDy
	XVzeWLOybrD5nIZ4g2HAnzlujiKgLff4gMQgcQ6w56CooqFQXgPybL7gxO8s1m1h
	1VO/+c37m4ObAWcnTpVT/gg9QgA611Lr4ebrGOxbU3MdR+NLv5Ve2mkXK5OCjB+2
	W3d3/b8NaEx7oRJzXPxramL2NbhUk/m2bJ0vEAMTCHM3UF6gjX/SaQC5qCVPLjjR
	k2juBGo8D3SaarlLyE6ASbPvMHRwcBjhUHoCA5US8AI4pQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v1w7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 01 Jan 2026 18:53:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d26abbd8so349731621cf.1
        for <ath12k@lists.infradead.org>; Thu, 01 Jan 2026 10:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767293590; x=1767898390; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ik6hlVXeTmBKrAB0aF6mx5+u5ON4Nq+bNmY4Sp4BCBg=;
        b=BbyBbV4NCHEJIKUcsu1LDk8zF+Sip5brjiDhiH5R2dA1QBVfX1rDpXGjPHbUFqSaWz
         tTxjdTD3wBk+Tkrk9q4Dqy3apvcAzUAcMqO2XZIimlRm7dZfUDhwgFQJ/tQJK9a4q9sm
         +g/74TMpqgaEAtk2bjv+lLuEHJAVhCZ4OL0gShIfTyaQz0pKGUhQ8D5pIm433XnM2q75
         enmBHSSFgpvOjZH1OssvDwnQCE0mItgbS4ETTNhttOxUcTbvnHn2Julxoubkadhbzys6
         /thyStgYCMv85kNWptzH7OAwwggcAMHWAJp6WXmuYO8rOPiz/7ac1jnEG+xbORUKCZ+F
         u50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767293590; x=1767898390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ik6hlVXeTmBKrAB0aF6mx5+u5ON4Nq+bNmY4Sp4BCBg=;
        b=Tm58vicgEWS153NGzafwjquj/F0x2bBzu2ry6ELh1FyLXpO39aRGS28mEXWHGD9CDU
         nHc97tPTjI9+aI/3LOksteeBDR99lIeVrSinYAP+baSYvtIQ2s3EnKMHrWbDKK0kPkZZ
         6BL4D4sW/tC8FzBLsroITCCFPGNdOlS1G7GrVA+odBUIAxJ7FXpV+ZLbOqYZSw7C6QOL
         xt9V/IAA2aIZqcbQ1RYwzgXrccQyHA5GzWIM+vWWc2ICtpS5AFggQdKPFYK9V9dUIg9+
         +mFHhddcLSHKx9DcmAmKKMM0XnA+yMHw24GeF0Wosy7e6aguroKZkmZ8Bax8w82LRalO
         HCMA==
X-Forwarded-Encrypted: i=1; AJvYcCWvJwFDbgfWZ8yF/eHM/ZG+ZwvygtaV3pYB6fEPH/8BZ5+gHaRW2t5ZO8WuZCzZOiv1RKzUo6U=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVUJPw5F3IjNPxiJ6w64LJp5RpULowrISmPtkI3XUwfPVv7j9F
	6/hRxqvG4MQ5Qh9mQl4HLGSnYpACUCAfeiXo0vSavDPfYVAwCs3ZduCzqmRVC95rntCFYFpsIaw
	E7YLsSQbnsqndosL1CAdBZ06BKPE4lUmQUZ5ey2hd2SrL/A6a/wBZKneNG1lgMlAZ
X-Gm-Gg: AY/fxX6sGt3nkZgJXsag4vkHBmRxrkflTJczTlFu12YugZ/rraKLmeQpEvXNyM8VdQA
	Uh/8/SfJboUTnHj0F1N4dvE5dFmwyFi29atIFQLc9NMZOZL1z78or5RvqHcH/nvN0UbGXnNsolj
	kwRsG4pxZ6Y+jDrVrtnoedsvxm8S4rvUis+i95+XDblp/0sATLfP2mdnMFbCZW6u0g81NLBODv8
	483AdjwDl9lWqTaf7PiAgpcR0WEL8949VibmzcfFk6PPXY4xIdh+npB3mqJT69vVuCJvWERsllZ
	/mwqvttLKijd5DhTHcWkURfWqMrWKaIsVgUfu6zVpXuuGjZNIcvsoU4dhNXgnpmh4Ia+CQsqCht
	YmIAVnrgiAMkmEfSR1aTG
X-Received: by 2002:a05:622a:1f06:b0:4f1:e0c7:7892 with SMTP id d75a77b69052e-4f4abceebbcmr599601231cf.21.1767293589945;
        Thu, 01 Jan 2026 10:53:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqWg0OwJN7WPv/Z6zzoCKj3pxTkw7ICxhLJa4qdOrQj71LJo+OUfAsFJ3QIwlHL9BMYoFVPw==
X-Received: by 2002:a05:622a:1f06:b0:4f1:e0c7:7892 with SMTP id d75a77b69052e-4f4abceebbcmr599600801cf.21.1767293589362;
        Thu, 01 Jan 2026 10:53:09 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b836b9b08c2sm1537526166b.58.2026.01.01.10.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:53:08 -0800 (PST)
Date: Thu, 1 Jan 2026 20:53:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
Message-ID: <bah766ajefvfoiqgbgjwwlbbr4ech4yupo2wjogejxcd5tmq4p@q5powzzdfbbf>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
X-Proofpoint-GUID: YgcahbOcCGJbE2X0qJKh4s8E04Mjxe1E
X-Proofpoint-ORIG-GUID: YgcahbOcCGJbE2X0qJKh4s8E04Mjxe1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MSBTYWx0ZWRfXySTnApAjGZ3j
 lKWVElw8Xzc07pkXABcNZJMBXaYvE6R9C6vSnYPQvHy9sWjFSS25Ln/mZpZQdEmHGalUVg5VN4C
 woRcDZExz04R3lEL+IFce41WU8kVkdqAnrZD7wNktzZcgAzk+Phmr1NaNDXcj4O9N3+eSx+jcsC
 idndL7ggLQi7t6vyRdc617sFuIJlDB3XiXYziEbsJuJVLS8xVjThMJdK9x7Y0S4sUOjc1uYKWg/
 hjY+sVIFv3LevWWD+xLvrY8AsLLxN8xUVFuFLQ5XMIx67c5WcO+IUpUIEDX6H11zOovNARp3otA
 N+DpBeN2LJbq3wQ+o6Xrsr/bsddTBN+ZxKNZwKfhyg2KhB7l/LpldVqU/r9qWIr+MO2xGRTyI9A
 c/XM/NqtByu47MS9+ANqQ2gi1Z1Tu8FlCVxcfbB/AnffRMOtH4gTmhb7i8a2u5/dkGm/jMVEluU
 UbXAAwDkGtnZpll3l8g==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6956c296 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_105314_574685_85688F5E 
X-CRM114-Status: GOOD (  19.00  )
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

On 25-12-18 22:21:44, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the client
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
> for the DL channel may get called before the client driver is fully probed.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
> 
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code path
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
> 
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manually.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. This
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
> 
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
> 
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Tested on Dell XPS13 9345, so:

Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

