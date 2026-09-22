Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A68C982FA
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8oRSt+sEOboeNFCv168cePKrrWr+FqZQJjlgNOUwk0=; b=Cq9FpZu8lw4AZvDjPNjc4KsUU9
	IpRvSdmagO3kDW+n4BpD/+RTdqx8hIbSvA0NOcraNG/uuLg7t/ZIHLGgmrfAQkQq4nsVYRfH8kSzS
	qFr2ckz4rLlvBbabc+QIEi+zhJyfiTsMiTr1LNAMR9Td87XkHqWwF19RWm+SwiSUfXCATDEf9xrX9
	PtYf5c5vfVzAjw3hscE8LUb+cUaQ/PRRpD4P+4tWsELcqJiVKmg+w9TVn9282yRTmgS81tQ2sNU4i
	T0QiKZG6HQPpwAlexx+NpK1RdOXRRwtXzIE64NhJexTK0DfN5xFMqML9U1SuNMo2Eh+aOS8Krczp6
	vYpTsGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93yk-000000069YS-2U5H;
	Tue, 22 Sep 2026 17:08:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93yi-000000069XQ-0Bex
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 17:08:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjL2C318161
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 17:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8oRSt+sEOboeNFCv168cePKrrWr+FqZQJjlgNOUwk0=; b=Svvt2SmY3+ymXzIc
	CWQFf9FtmUpvg7wLbV3aChiv1BvdzWYKR/XATRtCRlgqY2s232oIzC2ikWZSnQXu
	vKmpSVO+G+nqMkEI7Qt5YfXiDjx+htW+pI164UPoJdMlFp3uP0aLazcfg0XJhp7w
	gwPTVTV8fOUliKjD0nluzlof3bxyI6pEtCzXziTVhi4N3kf6Oi0E2dXu7Zon96Os
	ZVDi5Y6Y5T+LYGee5fJ0vyUlGU6kCeTfIQCLO/hTzJUFMgKkvsIthosPABrg3MK4
	8e6z3f8/giPGT/MNioYR4oltQpimlJdnMNmZa/7pbfyFqtxo0UAC9ovG0zBojsOe
	EJChxw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqjabc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 17:08:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97ca6578487so28009241.3
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 10:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790096895; x=1790701695; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8oRSt+sEOboeNFCv168cePKrrWr+FqZQJjlgNOUwk0=;
        b=bNS3UdHVoO6Nm2FWTaLVM0YTOYhswJVIlFPpnpzaIdw53dQ5UASR+7Oip+Xeko6jjh
         O5KgLGY3xR9JvC06zTckLmUj28Pi0PcvJ0tAoIOxRzhYiRiEZtQm8DuTJ2Y8Zq+2MfVr
         bvp8kLEMPBZkvKisJwaPmklqlRNNj4lGFXEDOBevrpGuMqFCfb7u/aHnVyE/KviH0xbi
         W/4aHoez8TE+06wNCQStN/HGke9gsXQYBECRv32pieJrHlf6AkyL5cx7GGk6zoRvD6cV
         SdA6+Yx6hDVzxqUeAxvepFCJZf0Lc1sQ2pOjvhtWe2v5iyzU0+M2AqTKttF/VtNhcx90
         IcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096895; x=1790701695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8oRSt+sEOboeNFCv168cePKrrWr+FqZQJjlgNOUwk0=;
        b=yIuP+wNzVTZ0bcOw7sewMfk/uB7ogG9aR5Ze5d3doB921TDaq2f/GjdVFQZSj+w2Bb
         ZF/1Gta8NhtI328/+95oQPZsK6gRGISsFPqc57p6kOdJs8RE5Y3iIs269QQ9qfzZ9csr
         SihjNGxHctG6icla4M6vKerD6yU6UzhqzJsUCPWbbCcrnYz3ZOnPZg7+3ur0PlWQr623
         /0GPr3r4VDLn2rBmhg5WoTEWthFSaEI7t1tLXlxZcFh2dKK/OVg7EPyY1x9JADqe9fum
         95tKUxB92lY31DLc0RvTyZnvwo5LomL/guwqorNfyDe+4pUzj+r4JKLgdEyuKRCKB2TU
         3vZQ==
X-Forwarded-Encrypted: i=1; AKwUvBygEQvEW35DyWiUKgRkVq5/jCuV7MS1w7NordhSQHVrSbeZl1XKCm0qIWtSAhZIS22pqwcv/Qk=@lists.infradead.org
X-Gm-Message-State: AFuF++nnSbH7Em9AxBr1M9RW+ByH3oaknoR/WKF47j5upGoHGZsblVcg
	B2tOWJhuqWaTEhvSJUITeLodVnI51oHZn/fh6Wox4rea9hceadO20FuofLHxzB+zfF5mxWFqL2Q
	4tPQP6LdQk7pQfLOu8Ptttv+sdH8czZH/ihBPeQzSCyiCYqhFvD4XEyEzy1otHVT2
X-Gm-Gg: AYBFou1dVkSio9p42Y7qX7hBhf6bDFjTRBuQJwb2XlmlmW7b5nJx5TIha2pNtfLfN8u
	X1nF5a8YVj3tj4vBV5viYgnyrp9lnIZo5f0t4wJ4rLuAPhD18epEdH8+rGcLNf0qX9X8FaHGjY7
	FgbdWdHOmCi43HPXV5SVYHi6jZDZFUUKAzP/QyP9kfk60fVOnroSL23tpcBBmmtHRa61iE/F67U
	Hrq/sGEFGjWAdXpIFe8VikPX8zp/8NFLV4o6kWlrvZFec25biac+tUK9RxGMqBXMDEJ0A0fyk/d
	ij9GD32Vkw0qOXwhDfW+cWrzqcnTP8FYHEILoT/9hlaG4+J71BTvVrciDZacwyg8PwNDiAKMZwH
	x1cATx3xNiGkderehV9IX45Em72ZI7W67fVAlNyU=
X-Received: by 2002:a05:6102:8094:b0:7a7:19aa:8a85 with SMTP id ada2fe7eead31-7a719aa90a9mr7105779137.32.1790096895138;
        Tue, 22 Sep 2026 10:08:15 -0700 (PDT)
X-Received: by 2002:a05:6102:8094:b0:7a7:19aa:8a85 with SMTP id ada2fe7eead31-7a719aa90a9mr7105724137.32.1790096894617;
        Tue, 22 Sep 2026 10:08:14 -0700 (PDT)
Received: from [10.243.142.186] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1c0f6csm5359905e9.3.2026.09.22.10.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:08:13 -0700 (PDT)
Message-ID: <3f5da6c9-7394-4452-92f8-b773cd34aecf@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] net: qrtr: Allow the host QRTR to assign a unique
 node id
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
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-1-27dd80d841a0@oss.qualcomm.com>
Content-Language: en-US
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-1-27dd80d841a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI1MCBTYWx0ZWRfXz4TmCAg2BExu
 Z7uoCwymW9MtCTeXt88KqubEPX4H4KAF1K6QNv96wi7+sbzf4xkpg2gDaluSxU6ajXsqtG5IweC
 BgVHZtUkj9Ws+BwSODBJ/YLbq4PCUHChEl6XsJf9E1VksN3XZ3I3gdFBiSxZs/uanNM4NfhRaav
 YZJt4yogRrVYSUVoftumtm6jqeoh7bWgRm72fuVcwQJK3lRMS0OoHhP4lcA7pnHY/ZQk4GIHobM
 S3q9PYxCEnQhe5VRuUSZc1VXxd9MhJizEWvevhTf5y3iWT+gpAVqBGvfTy2GDMZ8nPbUMOp3UXU
 tMta0wsM2HHJYUYauayXSjSW74bke5/u4pYGvHwmxPTNkKsi/mQW6NrBp8rTAN1IA4c18O0MckH
 kKCXp/RXa9xyXUVDB6+Nrb71oh+3p5cR754bcrtnl6bS4VzBX6gv6jYpcfBVQolQ4wLcF1Eu0x4
 IendsfqnxmV1KUFxYxA==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2b602 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JX_TeLtU1EXCEf5LEwoA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: Nk3PdLH6HkTWPWFuzvfhkVoIfydtg1Hv
X-Proofpoint-GUID: Nk3PdLH6HkTWPWFuzvfhkVoIfydtg1Hv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI1MCBTYWx0ZWRfXyYIinlNEl7l6
 duqKJjnjxzJY8qjieaK/ZFotPjoinLXD9PWaZmIcnex9bjDroN/igxcIaf3PTDFfCTVaDksCEq6
 QGtRGznvogcQpMYTQT8GB0/OMSpd8wU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220250
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_100824_198814_60B3DBDA 
X-CRM114-Status: GOOD (  13.67  )
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



On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> +/* Replace the node id in the control packet with 'node->nid', if both are
> + * different.
> + */
> +static void qrtr_node_rewrite_ctrl(struct qrtr_node *node, unsigned int type,
> +				   struct sk_buff *skb)
> +{
> +	struct qrtr_ctrl_pkt *pkt;
> +	__le32 *nid;
> +
> +	if (node->nid == node->ep_nid)
> +		return;
> +
> +	if (skb->len < sizeof(*pkt))
> +		return;
> +
> +	pkt = (struct qrtr_ctrl_pkt *)skb->data;
> +	if (type == QRTR_TYPE_DEL_CLIENT)
qrtr_tx_wait() will create a qrtr_tx_flow object keyed by qrtr_node->nid.
qrtr_tx_resume will attempt to retrieve it with qrtr_node->ep_nid, which
will fail. This leads to the HTD path pending packets reaching
QRTR_TX_FLOW_HIGH and block indefinitely. QRTR_TYPE_RESUME_TX should
be handled here.> +		nid = &pkt->client.node;
> +	else
> +		nid = &pkt->server.node;
> +
> +	/* Rewrite only the endpoint's node id, not those of bridged nodes */
> +	if (le32_to_cpu(*nid) == node->ep_nid)
> +		*nid = cpu_to_le32(node->nid);
> +}
> +
Thanks,
Youssef

