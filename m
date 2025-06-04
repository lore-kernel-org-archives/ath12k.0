Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5F7C5B543
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6QfFKXaIaqfEd/FkWiKq/aVwS4rH4eHPaNClleRyo8=; b=yt197Kjgj9Q0BjhyrDXSWBsAfq
	kFZw/h7Yrk8KAN638OPEnAwToBIhqFkMeXCF7yLXUwXIaLGm7k4ReyFjT5/RvbNGmB8XMbrM20jnx
	90xTy9+7fbaoQcQqXus0NOoc7dZ8m8yodmfXxEYYyMfshlw54pehSLTUu9XuLeQVoa30sYBTxL4Ld
	CgFD8VK8P7zJjvO/d1+Iz+mKuhqrW0s5GwcZxtoSDpGFDcqjNytQUHW5MMYWe8lShgPny5+Gd81iV
	Z7FvtkwvXV1f6AqyycXGzGgH/setDqD7j3LdXbgzUQG+zeSSH3GoE0svgJk2/QcqQEbaDdWrroyv3
	3kMTVQ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrzD-0000000DwyU-2pKU;
	Wed, 04 Jun 2025 17:33:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrwq-0000000Dwle-00RC
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 17:30:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549eDdN016027
	for <ath12k@lists.infradead.org>; Wed, 4 Jun 2025 17:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M6QfFKXaIaqfEd/FkWiKq/aVwS4rH4eHPaNClleRyo8=; b=D6Z8updlxsb3HFG4
	WKtQaDqfNAr6yC+zBMcBaJ1ar3YR65j+cK9scRCzzB6oYefJ0IyDOVzZX5Lrq1vb
	gn2uxS6JiejrUgFhklNQkszz3VQLNFNtV+bknXNvAZShAeI0jcMAbJPTUcqoZxkv
	bQmMzCoLdrqxPvrrecaqCJpdNdcTLXBxq5j08WY2+jN4YkcAsRbuAXBGDWXPRX+X
	qxVcKCZoaHOYxy9XaLunQGvUVaNQtqwcMSJg3s4bc0Ru4YwlD1DQH7Et9Vk8UAAI
	gJ4OgtXnJFMxFE6iq2TrZnVccQgDaVOZQeNU1oZrOQG6BIPnCreFhTHpkrr4dj0w
	8tr68Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be82k6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Jun 2025 17:30:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e120e300so34792a12.1
        for <ath12k@lists.infradead.org>; Wed, 04 Jun 2025 10:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749058242; x=1749663042;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M6QfFKXaIaqfEd/FkWiKq/aVwS4rH4eHPaNClleRyo8=;
        b=GPYKlXl4fPjqOMRurZP1xVwCD5ZJQC4RyIN4ttGTAklSF9vvCtivuhQyy5DAuQ28Mt
         UXAv98iLxofiFNnEs+Lu+95v/gSdcZgTgm7ymHM2b5ty8s6QEBn8KEpSSH92JTqMZrcD
         58EOV9acnXO5MyvWI8HJY4BQzutGjafjaKKlkpHCzSA0thCDWo1dxghIDWnLbFt5q1qN
         WBrrRhocZmBBSXC7IU6N2FD7R7dFTjHTHayH4c1fiYHIC6EgucgSSNEQr9SOKdnm9lVs
         DAk5bSSrVLupaiw5aQ6DKoxSk1GLaSkXroOlpZ8dXJuougY2/ZqGlbfVjDWsC1H8SzdF
         E5Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXickNj74zA9dewR792O9sKah3c/BROveMRM7nLC7k4SRDRFHAknEY7u8f1ff+8dy5wdBll0ek=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNHh0tSv/t8X32mkS5+EUo/YLWiDTwWswj+mCOavKRmk30PmlV
	SJ5S4IRkG3n/7xzF2eJfvYFC57DagG34S+7P2dns955Hdyt8E0q5NCTFIRcsdL32FJasKa18pgc
	h66HFfv9bOtUBnmERXtEq64VwADriIpSWOUy3S3GZSrjmH3WQa1cX8f7RkBT44Ms5
X-Gm-Gg: ASbGncu+QHl7lZ9j81Fup3oBSJeEO14eOvFd//ikDuZVVCv/JBZGPNZYFGlsDardx/9
	yi8MOuu1aYH+BIE8LLgJgSe52uaEEnf7f7/gNXGnLnHRiWVoWymbuB968pXE8KgwJa/xKEGWJYh
	ISkJtiedcTq2iB8vLVEZFCR/dbEFHA0YU/t5Aq5Gc+LAvLILrvtgqhDVWaAzFEYn6+fAu7yEBBR
	txKKxD8xNFkMdtC+VBgOwwPxrEM1pniXID0IABSn5oTiDA34kNie8KCwvq1lw9XRYvBWUUA3kVb
	TdpW3OPz6hjS9VM6bQEL9+Iz8Rh8qCmov/2MC7bf+9zuh0oGH6nRvRamsenOvNaclqU=
X-Received: by 2002:a05:6a21:648f:b0:21c:fa68:b457 with SMTP id adf61e73a8af0-21d22c6d975mr5964069637.22.1749058242198;
        Wed, 04 Jun 2025 10:30:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE912qLDr9L5IkdgKjb517k46WEvSgY7TJ2XqRQ5es0xea+pGkbn1tThWjp+5oOBCAedAJytg==
X-Received: by 2002:a05:6a21:648f:b0:21c:fa68:b457 with SMTP id adf61e73a8af0-21d22c6d975mr5964014637.22.1749058241756;
        Wed, 04 Jun 2025 10:30:41 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7480375b520sm3006149b3a.107.2025.06.04.10.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 10:30:41 -0700 (PDT)
Message-ID: <ae1215c7-5ea6-447c-8c07-5667e13dae89@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 10:30:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: big endian bringup
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <aD8HK4Iagc99skN5@FUE-ALEWI-WINX>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aD8HK4Iagc99skN5@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=684082c3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=CLgnCW3GpZf6G4-LuiIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: zQqW7nVqMJ0eyKrMwgfR31Vog088KRie
X-Proofpoint-ORIG-GUID: zQqW7nVqMJ0eyKrMwgfR31Vog088KRie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEzNSBTYWx0ZWRfX5Cdw4euUwRVU
 dqYpCQYAVGS8Z7zkLpkxIwDIQ7JuZYKE6AheAC0JnR/7GUjsTT1xCNUrlWIpbEH8HtwusZ562y3
 c8Unjiyv/cBMbZSt/Gi9H1Or0KPAgEvxOYNNc7qsbOrrj5OvNYnoLpqT576aThJpr6ZNv+BzV7u
 +cKIAjPr7qwnFRmFd5DUGPeWiDrFAq0tokeTFEpCDgFktAdhOnJ04A8/q+/JwO3N+RfX2RacYnb
 IjXnZHTVZH6OT3aX7xnur1LnRKe6pQqYi/fpOy8DscSUr+1aWMg5lcaNcIH0Ypk6vcZM+T4Fp3s
 1EcrBiWdh8+QxcmKFTkhL4JQhMNOqVTO0NXWnYLV8N97s1iOJVHM/oOip3eZJZcEaWhlFVtWokQ
 t2TPqX5r0d8FAGhe7X8TcfDCuZ0lj5n1qUiEYcTJw5PhHPATC5UuPEP4/VCI6CGrQKdjpU61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_103044_092675_986929DB 
X-CRM114-Status: GOOD (  20.90  )
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

On 6/3/2025 7:31 AM, Alexander Wilhelm wrote:
> Hello devs,
> 
> I need help to bring up the QCN9274 with ath12k driver on big endian PowerPC
> platform. I've already found some issues and fixed the MHI start procedure [1]
> and QMI conversion [2]. Furthermore I added some endianness fixes on 'qmi.c'
> file and could successfully transfer the firmware and boardfile to the wireless
> module. But the firmware does not start properly.
> 
> I'm trying to analyze the error and don't fully understand what is happening.
> While 'ath12k_htc_connect_service' I expect a successful response from
> 'ath12k_htc_send', but the connection then is timeout. It seems that I should
> receive a message with length of 20 and at least I get one. But then the driver
> remains endless in the 'ath12k_ce_recv_process_cb' and I always get a message of
> length 0 from the 'ath12k_hal_ce_dst_status_get_length' until RCU stall happens.
> 
> More interesting is the 'CE_ATTR_BYTE_SWAP_DATA' from ath11k, that is still used
> in ath12k code, but HAL structures now are swapped in driver itself at the same
> time. Is that correct?

That does NOT sound correct.
What happens if you unconditionally keep the BYTE_SWAP flag disabled?

Note that to date the ath12k driver has not been tested internally on a big
endian host. But your message at least has folks talking about it now...

/jeff


