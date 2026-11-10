Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BC4606A321
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ValxW9DB;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JKU5mAzI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bo85Anc6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KEtPuaGt1jAhVQJZZHgTtX896CwZ7ri/GzuKGtUT9Z0=; b=ValxW9DBRn4eCV
	GDK4D6kKxQPXXEfNWRbGF7J+tREWA5X+OvGRTnTFUKWBtfbF8umEwLkWyvO8STAni+vMV6+AfDXqF
	M52TmNrtwWJW0/7igRzWANuGosvST21djw2Z251qG23OtPTXyOJuI62ac4cQ+NIFtXmvfTUu4O8TY
	TWotUsp7rw1p6/lclUh4MnsuZX/1Ma74CWpnsyPC8g7Xrcjt6cmR8cELjdkGyPyNZfAySWHK0oWtC
	Q4/gS3KdWQLPmSVMblsoQde2Dx8k31Nv4podRlA9Ne+ms7S3VHzhqcGOGsQcuWV+37yUjmRzfe1zX
	oZapuXWjhnqBwWw5ep1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfVj-00000002fT4-3aB2;
	Tue, 10 Nov 2026 06:39:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfVh-00000002fSZ-3Z6g
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:39:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A2IA2249765
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEtPuaGt1jAhVQJZZHgTtX896CwZ7ri/GzuKGtUT9Z0=; b=JKU5mAzIcxFyY+O1
	3ZUmw57H5p0YG7xflLHXMkJt2O6CUENkQ9gkr5P9K584be9TuTyH+k43tAZObE6d
	/v0Wc9BjXKUl5IyRiU7TObncGnwDo/vNhVoYRIYZqYuxNN733G4cWTD9svC+UTjB
	Ch8md2txrMiG3Ves+EB7kqvzAOiq06njsTGY/esAyVaNsR72P/7vmSJDqVyP6NIP
	Is3l5LHR8LN9cDIwIM+VRpKqy3eKVabKkkBtqHOIOOZPXBoREc3f3+mNYj7ohqRo
	7KUa/wCQfWG245eW+O61WVtFrjQGRT9TmBCK+LO/EUuoxwwf1l759K1Mf2clMNHx
	znhVaA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapc3je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:39:13 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so2115066c88.1
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292753; x=1794897553; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEtPuaGt1jAhVQJZZHgTtX896CwZ7ri/GzuKGtUT9Z0=;
        b=bo85Anc6D5nyLdIynT3nkSyA5cxAuJB7kSZcoMgEIjfh+1Z7o3hnx4zIYhPhoIrxNK
         xigBp7Txqj5iDiYbgvmZtrmQyax9F3MYs4AN5PU3O2F5MLLEIX+9VqAVyypLJftz9aoW
         ozQgxS27t9MRU/tp70MmBkOcBe3pfBdHZdlewhHi5N5yUEdyVCpMHH6AdJAHT69/9697
         e9wAV1TQpkkhsb6fc/HNzvsHnLbaf8Y6cb79TEWThdL0chL/uFGqtxZ6ymPhvN3VUGPA
         BJQjAXB18YCp5WPa1rh6JUltqMy5TEpbC4+EwNEbZfX4ESC8mTc30Qb3MmVButOMDGXg
         yf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292753; x=1794897553;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEtPuaGt1jAhVQJZZHgTtX896CwZ7ri/GzuKGtUT9Z0=;
        b=TOfxlPiiwPb0l2rny+7HXAoGyhUrvlhnKdVFQrE+/E9lbw4UH9QP4Mp2iCieGoQcfI
         OWfG1KUZGD9OlxGrblyKzuJUTXramAVOwCoA40CuuS7ke3LhttPSiZIJC/kcttI+ubu9
         DliVUWz8Ni1d9Yxw3cmBFKTJSJOpuRJuKioxazc8/MtJsqjxNad8NFLUT+u2hoKDXCjZ
         82jo1KoBaFbKzP6nOV2bOX+SKjpAJ1czwCItPCO2AuFGL7KQMr0PUdhOz4jsGjFIbtBk
         kqNvM5UNNiGWYxhCWrqQNgyGLRytehnsM66mB8Le7LRl72gQHZLbIFmsH61DQAkJCXnQ
         3Y2A==
X-Forwarded-Encrypted: i=1; AL+hErEon52c/nAC9a65J1AZ4/RUBSN0ESYw8+5wbrK67hA6HmcgcbKSoOal3vGYknCJOetwqI+aLG4=@lists.infradead.org
X-Gm-Message-State: APuU4Z/fni3QkqUkxCfg//6/UpUcUpFeLW5zUYmcuVXIX49UggwDNZQj
	hyRd1jKzVoqbc7lfC+6rT57KqrIJF10Xspf48iHgV/fhyGCMxKHjdvHVr58JU7zQt2G6c6UYiTE
	U1cSVe3Oo0owlQbYW7TJhXHzH10MOpD54q416DrwKXCvGciWqYSEQOjHOcsq1HExy
X-Gm-Gg: AYBFou2OvmXNs5Oebwutx2hgRw59aoA6CXmOjU1DcknkaDudTTFNJeex2c/kSyce2ZF
	Iuiq2XKlLZIHqvCSunK1MpJj0P+u6iTLdydjFFY9KuzoBQnNH2kk1WhxBnrk/GK1gDDLIFwmCwo
	yHc2HHK9ie/K1ig6MGZd65IrvkYj8XI2cBtRuzr83Obw6TsdzSuLXpUoeYiMiYSzUlaVQK2nanW
	VfhidOW2vc2Oi793TjhAJVpLlTEey3sN7QMthh/5SQO0iquHuo8hPBBMHiu12Js1V1B+F3/Bed0
	avsJwLi1Xam3S9R3FdU1uIrE9eYI9P+LRJqkH6a0ZS5J/nSY7wZAf6Ef/FOpySogua4oJ9OCd0Y
	9Y3dzRTrfs0B6Jpn6mxZQLybwT4v7e1Ao7iR0gw4YD2Z12FKVI4Xpucb8P5qf8xJvnOdNYln0IW
	/i5NhT6b6ISUBFwg==
X-Received: by 2002:a05:701b:4554:20b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b3b6025d60mr2472551c88.24.1794292752403;
        Mon, 09 Nov 2026 22:39:12 -0800 (PST)
X-Received: by 2002:a05:701b:4554:20b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b3b6025d60mr2472519c88.24.1794292751776;
        Mon, 09 Nov 2026 22:39:11 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm4318708c88.12.2026.11.09.22.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:39:11 -0800 (PST)
Message-ID: <d70e7ded-a378-4f7b-a599-df59f27e81e5@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:09:07 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 11/11] wifi: ath12k: use link_id_map to
 resolve RX link id for all devices
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <20261102-ath12k-logical-link-id-v4-11-f4c7807c299b@oss.qualcomm.com>
 <1107c457-74ab-48b6-b45b-afe4a868a55d@oss.qualcomm.com>
 <c78e9194-ba3c-47ea-8876-9bf6bba4d7ef@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c78e9194-ba3c-47ea-8876-9bf6bba4d7ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXzfr6wHpnXJ6B
 d9HDin+TBBKCsPdlHQaxo8Or3tXY0LY9H0cKwuQ23rJWSqNJ4IaM8MPhoQxuc3AI0zkqsTGBbj9
 8gMigi+IF49ysJeUPl4Y//+Csnv75zC/ZiCzUhzAaNA8Hdm2bjxlrrUCJPfwDtvBRGsJBfeh9VR
 kVV+ckW2QsClasjVrOydRgkhEDyn0QzPJMWppkTqKZmXF0m7OOX4FSg1m7bzz+L703vV6Asf8xV
 aoHik1yzFBiafM8/4D2z6PtgrPxtFN8IyNKrJPps4M5ye35D9pRJX+ZKefa0/LU3FC2wcy7Vo9n
 xeQtHUcuIA8aFXL5H15QbNxCTmCyTEpzkAJg97+xXt+Rxy0QtF0NUUjUXLujVbd7kZiJ0s6+SqA
 ZvrxNF/UDR1J32TrkscV2mug+jOhEBx+OAg9nQ63JmCHqP286Xzrv28ghbFaE7r0yY6YdqIxvy3
 uEPokFNOGlkRlr9bTng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX0KqA6rv321op
 d7/suY9gsiFFKO1BYhcKpjsqG95iZerILUTpaNy/bJEH1JQTrjB3Ba4UqXZ9QnMxRX8dNhl2BtN
 4bPPTFhf+S0Fr9J5KG1QZsEFqxggMko=
X-Proofpoint-ORIG-GUID: qVp8F3cBn1U-C18G12xKcgUxJk2Kymy8
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af2bc11 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=GZM-sObfk6PoSxOijBQA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: qVp8F3cBn1U-C18G12xKcgUxJk2Kymy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_223913_900661_9C3D027D 
X-CRM114-Status: GOOD (  11.63  )
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

On 11/10/2026 12:06 PM, Baochen Qiang wrote:
> 
> 
> On 11/10/2026 2:07 PM, Rameshkumar Sundaram wrote:
>> On 11/2/2026 12:08 PM, Baochen Qiang wrote:
>>> Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on
>>> WCN7850") added a set_rx_link_id() op so that each device could resolve
>>> the RX link id in its own way: QCN9274/IPQ5332 index
>>> dp_peer->link_id_map[] with the hw_link_id, while WCN7850/QCC2072 walk
>>> dp_peer->link_peers[] and match by peer_id, tracked with a link_peers_map
>>> bitmap.
>>>
>>> Now that ath12k_skb_rxcb::drv_link_id carries the driver link id for all
>>> devices (the hw_link_id on QCN9274/IPQ5332 and the logical link id on
>>> WCN7850/QCC2072) and ath12k_dp_peer::link_id_map maps it to the IEEE80211
>>> link id, the RX path can resolve the link id uniformly.
>>>
>>> Revert the set_rx_link_id() machinery and the link_peers_map bitmap, and
>>> derive the link id directly from link_id_map[drv_link_id] in
>>> ath12k_dp_rx_deliver_msdu() for all devices. The NULL dp_peer guard added
>>> to ath12k_mac_peer_cleanup_all() is kept as it is an independent fix.
>>>
>>
>> Fixes: a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on WCN7850") ??
> 
> hmm, not sure here, since it would need to backport the whole series which is too large
> for a stable backport.
> 


Yeah, makes sense. Let's leave out the Fixes tag.

-- 
Ramesh

