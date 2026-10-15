Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26B3CC6B34
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 07:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=; b=FmrwB59Ys/J2suMeZ9v2aEdPhd
	0l7tggU2eb+i4Da2DXfaI/F2zHbKt7SpJh7W744VLHrTrXJX1HMQltLrckiD3u6upn0FIF7YzDVFe
	GQq3ihBummzRXnTnzJQ8hR2CPWVxq18KXz8v+0lCCLjWx6eULXRtHDtX/9HWtigab+V1+Ldl9gCR1
	tblYAqxyP7SRVneY6kCwF4ChmQ81mFl4vNC+PESDALmTNJj0hBoMumW6IDHL/hnnGCP4T4UhbKap9
	BpbiksP42Jddr6GPYq7n1T8zXwtTWeumenXWvwqhWSXF5szi8lNiDhb47explaAv0R4YLHBXVQuNH
	VZZMqeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGIP-0000000H5IQ-0Yu5;
	Thu, 15 Oct 2026 07:54:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGIL-0000000H5Hc-3USj
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 07:54:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6xPVV2121306
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 07:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=; b=BUOJCsjsIAqYjHJI
	AF3wypISTszN5hD+N7W+fcozerWK14lPAXXETxlWb11U5SEVyHO/pcaU2dDcBtfb
	L//nsOQN1X4j1tSgtPbLKcSMbS1eg1p6CmFKJ9BgZ8SgrbHrqEGovvgNS0GszWZW
	K/jrfOmXFu0hg6JvTfXD64s5h9xg7X6BNtG346VVjeHhYMIrUJEsoP0JwsITp6xi
	9tha3OXTg8lKiWDA/TM4hikFaMe2MZKqZ/F4uPgLGVnMRmgtG/JoPRpCQ1uIY+IS
	hIKCshKsh179sXkZwBMGuPNbFnNziTtXIEWzd+R+CkWS9PncY10GOsjoq/BMKATA
	bkP3BA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1jcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 07:54:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e93f67358eso15504175ad.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792050872; x=1792655672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=;
        b=JKKVvm3VMgy3jzmJFN/7K3VSOZNxycCGPANNn51QT1wjrc2L/9nxYToiN/wJy1V/k8
         /yBaqa0V3zP4b7aJm0Mtbar4swSh+/iw2TAZ6ZUKQC/3nPT4QB/HQ2KQvtQ8nqvOiaT9
         aaLJE9pUdtX4+hfrYKmi3A9Y6mur/8eW5/Jf34Squ03uvxVq+KuSAxj0+pPAwjC4N14Y
         Onx9RqFYL13lLbphoE6ZqtfRbPKL62sAREshWmUzuNcrupiBW2JNc5wR7LNVI35Ie/4D
         MwAJi1ihU/xGIxe6p7LGakTavnYeNfprUQCmRXAZnfAuSc0OZAdHCjbEwV4LSMQJvPMm
         er5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050872; x=1792655672;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=;
        b=0DVHq2m48h6nfFTNnG8xYTzPloMIhPwhcgKygmCAjTopN2CBk3X5yRL0lRBJgpcCtb
         jTMUwGioEEFUYl7wC1RkMv2lgZw9xpjFFTY8G6UiP4dH/6SLaYpFeOtdReS6XJKu3V4G
         qXEYiUuLdFa4Ax3noCTtl4MWNk55hHSkiWvRHrtTWKXGLzwaYIsoFh0ErPfMjqMBLr+o
         Rga9TXBFr0hig+rQUG/TwvMvrV8ps/VKinkJu6a7Pm1pYBfu7M15UbWlc4irwY8acDXY
         7O5j18adZsGoc0KYGy8PChPMM1Lyj5zStJUS/eC+vMJUnlCW1ms4CvbhFa7FRz3Xc4+v
         gYLA==
X-Forwarded-Encrypted: i=1; AKwUvBxRg1xzNJMbz2zFrWm4SGypLJeGsOEpwSqUfX3knpo5RG4qbNHaUn0AI58cvEIgeqDoxRPb270=@lists.infradead.org
X-Gm-Message-State: AFq9FYIEJg4luGJFQeanoFWFsm1EsnuJGkn2DuAltdBeg3TnoJk7vEBv
	UEr8DW4tssGvddrNdNK8K7h73X+WL4Cs+bqTpOQlCKwhew1PYeIMNIq7zDkWBHYFRUcSJuyz21b
	26S3pVRHvV2S6Bvr7ZXPcMcoevmcJPnorHEnnmiLaVpdRm5Ubm3jManfg1ZhVisIL
X-Gm-Gg: AYBFou0as5a7N/V2ZXT1XxAu5uFT1Kf6kF5tBdQ6f53O+Kuekr4pR8153jiK5DObVJr
	S1b/eZrA6HuJsAwMpBJ4y48LizvIrFCEBMsm2MQ4U6fqSsWjltScHBZrx9SsEm/G8yiagyf02tC
	TiIRqekvkZkfvyeeyAqQ/GsC/TK1mYIC/YO/1zhRPjq/bhSN9rTE/z/9zfy37McAq9qWYNUyTLy
	oKWZnTEzUe30WOtiffs8AywsfdnTryTZReOAQ43Ez4dXqYP742nBxFaSNv4c9/h8dF0EwzEjmUq
	WCClfygv/3lPR1ihsmARCoAiT+mmuiHyGYvb5bc9c6iRv3gCprDi4bqMj5vf9bGOkZdIFXXI598
	v/MihN7axA/kF7fjD1DimEoqy9IxxWmNFZviI2XFmVMyWg22kV0Tm4z84BM5i7CAQAezJLiC7
X-Received: by 2002:a17:903:110e:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e92a1a8ba7mr57665825ad.55.1792050871807;
        Thu, 15 Oct 2026 00:54:31 -0700 (PDT)
X-Received: by 2002:a17:903:110e:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e92a1a8ba7mr57665605ad.55.1792050871349;
        Thu, 15 Oct 2026 00:54:31 -0700 (PDT)
Received: from [10.133.33.32] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm76306455ad.54.2026.10.15.00.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:54:30 -0700 (PDT)
Message-ID: <56832d7b-e7a1-49c6-8995-4b17a442e4e6@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:54:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
To: Jason Gunthorpe <jgg@ziepe.ca>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, alex@shazbot.org,
        bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
        mani@kernel.org, yishaih@nvidia.com, skolothumtho@nvidia.com,
        kevin.tian@intel.com, linux-pci@vger.kernel.org, kvm@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20261011074514.515894-1-jtornosm@redhat.com>
 <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>
 <20261012144835.GG14213@ziepe.ca>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261012144835.GG14213@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfXzuPeLQOpMsLG
 ISAzfOCeyit/ieJR34BCFT1ROkUTyzIMBMogI+Pb4rMFR118H/gMnxB4kL72l9qmM4lWnlQfhVc
 uCP4bW3sJFU+V2zGNAG4eBI7U+VnpIF/NwasWPbroWiUgLYPlEhPpVE0jFm3xDy36tK03cL8qpO
 Z/9R1/e7rIbSlzydTHKlsgFFEtAnU3M8Kqnnq6TND9UwTVf+C/i1VHx+mMDOPoVJ7eZQPCQAz7z
 r/rq+itXkmHSbYG+dkvt6oD0GIRoORzHeoZrAkHCk+8PPTsRwrRRhPLi+p23bJeyQ65md6k53Ay
 dF5PYHL7f7M1u0J9QKaULyVmosXAm0utZIZ6xMGnpmIG8Erv0JWhfo3fb81pdvLEP0W+o72z3Tg
 oCeSVz5wUQOB1ks7fKPD0ysQ3SJXy3Thq6NboqF8Kpqbs9aZ1kEWlhKyXjz3LxJcx292zc3dCeJ
 S6dNcO8SXbQHP4Gq33A==
X-Proofpoint-GUID: LC-OOCOVO3yDR8gmEUW819cLZiOR-q90
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX8OSCDkKlQghb
 ApzOv79BeNjL88x9gU+u4PVzd2xoPM61kUmi7sVmR5JXmXwSzzfWfFpM4oRPPfkJvTKeR+eEgq7
 tFOC2IVgcZVy9JrS1RZGZ+Ko3sjQYfM=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad086b8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=n56IT1IzDtYYEsRGsiEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: LC-OOCOVO3yDR8gmEUW819cLZiOR-q90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_005434_034648_9D950A13 
X-CRM114-Status: GOOD (  11.88  )
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



On 10/12/2026 10:48 PM, Jason Gunthorpe wrote:
> On Sun, Oct 11, 2026 at 11:22:26AM -0700, Jeff Johnson wrote:
> 
>> Thank you for providing this level of detail in your cover letter. I've raised
>> this issue with the engineering team in the past, but I've once again raised
>> the issue with your in-depth analysis.
> 
> The main issue here is the driver can't use a normal MSI-X in the
> normal MSI-X table.

to be accurate, it is MSI :)

> 
> "private" MSI registers don't work for virtualization.
> 
> Jason


