Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92898606A321
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Chvke8Dg;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cd5kwCXV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kzvx8YBa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cnAFPAsLP3mQnmHLN/evzK6z0gz3a9aN1Zrlr7RDLyQ=; b=Chvke8Dgrq7UWZ
	OwxxBEkR3r73gJ6P8iU+A6VIdOQ0yZBW2xF3kNSY3JzFTCqLCuJvtXPFG85yC2I8kuYHt5QtnAQHD
	1vncAdBfgHha+aCArkDfR49NNcU0d4IjteT1g60PngsNtnVmL3z7AcLMmVcNbA3Cn/mgiYKugD54v
	xJWKKB80TPgnx54yLpta4Kb9sKs/U73BB/xvzgjCnakXjzp3PTVG5t89LbD6aeMpNM57bhvqjhLaL
	c8XzKtDJkLnlA4BYuz+gdlpsflmw3pF0jVhoL2qVYZ0BQtH6yW5v5FuSSTvcnitfiImHrQjRZ2Rj0
	1Oplu7Ij8USN+KOfHpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfTJ-00000002fHs-2KYI;
	Tue, 10 Nov 2026 06:36:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfTG-00000002fHI-1hPb
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:36:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A9FE679665
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cnAFPAsLP3mQnmHLN/evzK6z0gz3a9aN1Zrlr7RDLyQ=; b=Cd5kwCXVhFHyBTHq
	lBSX4nmQ/vIMNz/H9KCcNE12FbablzeYvKawjFkq1BOmKl1CcIFo9EF6FyHe3TeH
	ItN0c/B0MJYC4c9xWyDZvhi6FC5Vj5M8dxtd0lqj68X+2hJKFXIXDrwba6nXSkc1
	4i0uP+uu+ztMMBaa9FL0RzdehwKslS37VZNxk9vqYlsTX7Lof0XVX1kb5Iy6RUbY
	hy027AjCeWa3Xvk2OaGIKPzyC9PknDGrTBv8wF8PkZBWxgtFFRjRGhapaFM5qzTa
	Iv6DliTTRDY83kCgmIiyiCGS5vDz6V4rFMwmQbLj01ciaNbnGSBSRG67V3CPQ2r/
	/Cr5bA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv48sgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:36:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so2189428a91.0
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292601; x=1794897401; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnAFPAsLP3mQnmHLN/evzK6z0gz3a9aN1Zrlr7RDLyQ=;
        b=Kzvx8YBahGq7d4PtupKDnnQHjqmgaCI6d+MR+2s4dUas0zn8L8izdvbPHXlYahoZ9M
         UJ/gnItk1107HTUxecP+zyXr0wcc4Jh1DY8JYvXXg3hnyx0jIGMraru2D4KHr5Up3weH
         G0fulqfrvHpqPBPn2WzCpkfhmIDepEBzOcBnowlCqa2TrIgbAXaEl9rpYTt51FRMD2mm
         rzkJDqNA99zPhpQcZdt84N5N9VUT2SzYSkZ94Z52C+QcWP9mR9hOdJEqEq8PVUfFtsn6
         yeyidJPWFTAGCn47WQ/dbTwQtvrDYK2Xw18GBv3xQ0PZXNFL91RD4d1al5fFJUkZ20U3
         ahSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292601; x=1794897401;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnAFPAsLP3mQnmHLN/evzK6z0gz3a9aN1Zrlr7RDLyQ=;
        b=YAzFoFScIYwdAPKUPpP49D9wJsa9Ql5GsXcjeR+eNDTNmeJxzp918txIp5RX2UdMJh
         bQvhiIqTrnkpl1+NO7umeY988EjkSsEvPVAyo9/FeLHBdgHzeRrIsNRrKT59XZ/doGd0
         N1aHK3YoHMgSyjHxMPgnzMz9hIbLTHbh+iG8CEp6+Hrq0LFIe+scsEqcxzkTyw4wiEcJ
         Hp6U3Cw3ECRM6Puk27/mbgzpxm0HIPI7OiVaPpfTTjU4YofkwVrF6y4gyssKrjQSFWnh
         vytfEAMPqPKgOmrcBvBnleEEtBmEKnsyy7HHjgwmIuPLIIKGfsdIxUvsBvMnYIBVlyDr
         zwpQ==
X-Forwarded-Encrypted: i=1; AL+hErEmvn9zgKDoiVkaYW3yJyepcaeJ+xionqF91n/bTxGM7EQ0XexHS65ED4IaDDEyHoYYm1NMVSQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z8KSB+E/zmoI6nQOcB0sUjvw/55koCktVzLOs7Z3NkyWZQZaVE0
	ZVeuTyQI0uqrjrh+IOHkhuEko3YcqY5gmYYnuA2Nqt5jIIEHSjj4iwwN73PINFIaI8J7Llk8w7h
	FdsckmnkryjC0jNi+0U6cJ9StHUx4KinHS51UQmQ3u88/Olob71fq2osMK4YFDpsSVQktzhrE
X-Gm-Gg: AYBFou2JBs8iLaA7qS7jH7e424p/yN2+uXK538BSLn30L5yGuiQRKNbdYl8mJyLKSHj
	pJPlx2hJrOaREocECs/s9h3ZDnoPloF0dLn9tn1DCl9Zs/xZHyP7WCEn6Ci1Kru0hjsUZZaaszN
	GWv5f9HFZyGWdAb3NvfY8FNP4p+EjWvDyzCSvd8+QNyyraZ1vcm5msb5XM8MDWyXKIlotK0MZOk
	WoZ9QNctTVCRh+CHrIo1PhBcLJ34sgP67pFijn3Uw1BVCgV3O3vI8JCID0T8t9o8eYV8B8s9v9K
	WdITGZti/RsW5Y5c93RFTNKzpQG7Sv19JYBhfDJNLzICWozDJmoUVh97O3RV46MCt8keXPxc7DK
	RBKDbD74N6ZSF8Ntj/SMtI/n1/XA2ty58STIwYQ6ZDHvP+qVRhtH68uIVyB1wn+U7nTNjFgYt7+
	CsJ4JmeLEdAK52h9Ch4A6ZdT1a7b7zJIbReBWlN3EOBrkPUw==
X-Received: by 2002:a17:90b:4e86:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b166cc02a0mr1865036a91.17.1794292600490;
        Mon, 09 Nov 2026 22:36:40 -0800 (PST)
X-Received: by 2002:a17:90b:4e86:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b166cc02a0mr1865014a91.17.1794292599958;
        Mon, 09 Nov 2026 22:36:39 -0800 (PST)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2546598a91.9.2026.11.09.22.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:36:39 -0800 (PST)
Message-ID: <c78e9194-ba3c-47ea-8876-9bf6bba4d7ef@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:36:36 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 11/11] wifi: ath12k: use link_id_map to
 resolve RX link id for all devices
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <20261102-ath12k-logical-link-id-v4-11-f4c7807c299b@oss.qualcomm.com>
 <1107c457-74ab-48b6-b45b-afe4a868a55d@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1107c457-74ab-48b6-b45b-afe4a868a55d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX+H24bvdgICds
 s5OBp/466MnVIrNoQ5q6mFOs23IzGV0Ls3M9AanT0FdnBMy07b62Yie85JGqoGhIol9IXrQeGBk
 UiZEOrIQbpWxokL/2Eu8iZjQPF0W68Y=
X-Proofpoint-ORIG-GUID: E7YCDs0wchkOl902cq0O0IlbMnT9-TVf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX4YbL9aORJ9mr
 6rNDsYobNNRNydHn5pdmOmweKB2JliCCyJ3UVBe5smTIqQ2bJC2vt1p9V3+nwhegcaNLKudIxQ3
 RwzYj82pBfvi5INAU49tczu6VZdxa6WH0YrTrWz21etOM75JRGYs426ZqP/rWN/G1LheQzvtMFV
 GILyIWg7Z0k8NT5YLiDDGQbKrO1vEsptXhc5cq3ZAMpI5zw4B9qJChpfe0JaqalToAp7ASz87Fu
 n4uT50Coeer9xLs0rvVlLpVRv8yv7MPOK1ISipEv2Sj0IQQzLnXaPsYEWkmOQRGnbwAVTXeWRpY
 LH10YW4ZT4dHRu0wIJshp7XKc64q9Mp0q243DFVZvx7VLxePMan3ngBzxbmkUQtvmyKg+MrWuTc
 w4DkKO1QGzOu+0gFa8CXPLdBX4Zn/xmODSZkoB3K3oEvZra2Ch/LnffyFBA1xu+NyH/6A1Fvb6s
 3mgkrGQhyJtkVWOaE1g==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2bb79 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=p20JRixKrNupFYNNBvwA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: E7YCDs0wchkOl902cq0O0IlbMnT9-TVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_223642_462339_4BB23600 
X-CRM114-Status: GOOD (  11.03  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/10/2026 2:07 PM, Rameshkumar Sundaram wrote:
> On 11/2/2026 12:08 PM, Baochen Qiang wrote:
>> Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on
>> WCN7850") added a set_rx_link_id() op so that each device could resolve
>> the RX link id in its own way: QCN9274/IPQ5332 index
>> dp_peer->link_id_map[] with the hw_link_id, while WCN7850/QCC2072 walk
>> dp_peer->link_peers[] and match by peer_id, tracked with a link_peers_map
>> bitmap.
>>
>> Now that ath12k_skb_rxcb::drv_link_id carries the driver link id for all
>> devices (the hw_link_id on QCN9274/IPQ5332 and the logical link id on
>> WCN7850/QCC2072) and ath12k_dp_peer::link_id_map maps it to the IEEE80211
>> link id, the RX path can resolve the link id uniformly.
>>
>> Revert the set_rx_link_id() machinery and the link_peers_map bitmap, and
>> derive the link id directly from link_id_map[drv_link_id] in
>> ath12k_dp_rx_deliver_msdu() for all devices. The NULL dp_peer guard added
>> to ath12k_mac_peer_cleanup_all() is kept as it is an independent fix.
>>
> 
> Fixes: a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on WCN7850") ??

hmm, not sure here, since it would need to backport the whole series which is too large
for a stable backport.


