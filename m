Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35A6606A32F
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 07:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mx2Wk8/C;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P5Ab3/6E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JTUDeXlO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/sBFE4JMy7Qqdv4pjAUdbUZZk0aaF6z/Jc6BDucIaRg=; b=Mx2Wk8/C/ZlJaz
	0mC376MEAdybIKbXom63H5S7RX1hhZVRSts3PWGrUCunJ+TRKvRlLq8Ls/3sQfBA/t9/hOBs9WIa7
	XXiUa7ddHTgjfVZZ2+SvPbghc2D7s5Q/g5yq8l7vWO+byckbSjXjfmUfdRcYlFUHOFzJJuui1VcZi
	RmFqhqL2loPGHAHZHx8+ingXqKyddZQ4e3ADwIPiuPP069R8xN+pF5FBllUCFJVGAzxUJNVQD5/uX
	6LsCihVfbEMEmZ4IZU43vJqAG/ogulPx5Ue/V+xnpp6kxbaH2NP57BDU2DGQc79oYwQ/Yg63h+FvF
	qdybSMHp0GAv2bSP2Vlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVDi-00000004UAa-2WXj;
	Wed, 04 Nov 2026 07:15:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVDg-00000004UAG-1GH8
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 07:15:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A475rCX193436
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 07:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/sBFE4JMy7Qqdv4pjAUdbUZZk0aaF6z/Jc6BDucIaRg=; b=P5Ab3/6E+YOrq3NE
	6rphAYp16tIu7thpCAjY/9Bop/31Gi8U6aZuGyjOQSMtyXhi+6ljsOei263SKfms
	d8MusggKN3GLJl+FvqIeclY6+qQ8iswJJe2GefVk6w1mirYnb/7iCwVFAGhCQq1t
	qh+o5LL6ZsRELRuIHS6wS9dKu7JXjfq/Z32tbjKneCgzQOg5L5NP35dlx5PKvpvD
	ZSqo3OhGmaE1sWT+KXLKOrEiSewaZIdr4VWd53i6gBi42ILfv3VhxX0MPMz08qTe
	RuDeM20CvYKzGnGFq4PTzKEc5CaQrY7aoCoTlp6KoW/g1OSQjn2YjrPUIsLghuAZ
	zDGK/w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8njh6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 07:15:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05b68f851so1389209b3a.1
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 23:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793776539; x=1794381339; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/sBFE4JMy7Qqdv4pjAUdbUZZk0aaF6z/Jc6BDucIaRg=;
        b=JTUDeXlOj5aL7y7CQnGihp+oVhXcgWotZWIEio+2+14jZCbDg5Q5VHad/oimivYJrK
         tS+ZKWo4NYeYxUJOWdIeguiNrxDle8IrE5Y26yh8Y0vh7O+Gls4d7OHOfYtbFKK/FqYG
         iDKK/nSG4G9+CGCvMEzUM88bCdGKx3LGLwGel307k81D1wJcuvfeiTN7+zebPNoFXsL1
         XpdA1yM8CBGCab/nRvXfTZ6azqI7FlinE6l9/CjyW+GQj6mrhd7IELWx40tb2lS+pLoA
         uxxOsE5BzPyNLeSrtk27tylhwUMTz+BiE/G7YbfTlb90n7sxPNIomE6yj3a8l/3jX2s+
         TcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776539; x=1794381339;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sBFE4JMy7Qqdv4pjAUdbUZZk0aaF6z/Jc6BDucIaRg=;
        b=alvRulFeHCdByMKuhr+8gJYZQhP5mh1iYpRD7IDa4yWa+AAP0/ExLbOgwQjPZzxyvW
         X7bGpuMZi8+8e/gj1jGivhwaXKzUeCxLc+Pqu0zFWh9IRJaB79x3fxCM4i090Puft1nG
         RIwcbPtgxD3dEnJk8LDyDPTXZgL8z+v5inZ9yri0vZY40YMTbghh2gliP8mF5J6gKZ/H
         Dys1vBRI6qQMoU70I1LJIxBrpLAFRznVPtC658Z3R2btFvJb63JA+6Jtt0tOI4qBPE/i
         ejvgR9Mp+ks+CEr5r+fkLqcTltfgY9JE348ZOUinCecn38rAq7sFTdIsJrhLfulejk8P
         KQ7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzSHKCw7F45bd/LivnlPRwKO6OBjjV7gkqcN/17jmSZhbRsky72IgyIdiZVaE/JQzULgN0kiHE=@lists.infradead.org
X-Gm-Message-State: APuU4Z9Q2XGTUX/fPeBOlHFyTaOL9aJZsx873nfq/nA0WWeFahmXFytz
	91PAcIV89dUiUC5lJ9dGVr1tQq2kE8PT35SXcwS6VDY5aZc2cA/WJ++adixX+o9wA3ZvGlOGW+m
	3wmGEKN2PsVPLq0RbT+bqPXTup9Ar4JpzglKk0XH5HxF2uemeKogOFa8/QMuYYOw5
X-Gm-Gg: AYBFou3TGQOMwziAdgAwh2VIKnSZKMIduLJwquvpd6PNCs0iJb5uG4yus3gRlghYLTN
	93H4tM7Kesox9UGqD1mi3bulXlazQTXcPY64qSs19WBYqwr77xp7ntTs2dZZTasNaYkMJWPls7k
	wOuMPuU8avHlNbfeKEEpsFs5FiKnXPX0R1haXAy7BEiZXpKPM+AJ7azfDGWHWAMpp2lqgoM4fE4
	RptJBTrx99T3yoci6YkqHz0G2Bpc+CwbyG0L8DmV25m9k0YeKqg8LmWZEp2Awmyp4eRRpOI8SnO
	OBWlUDXj5wMN/Bs4bkUdHyX9hQmrZZ5jTw4SjqfcErE/jjvw8QatCPsQnVcD/i6wwGwHeCy/zUl
	GIQiVum1BNaeHyMIaKZzeWlcSIpZTBtSkcj2QnDi/p3popZYomkbIz+9QeAFFSHadPouwzMZ8Jx
	8tws8lU74mQP2dkXNxcoTaFGkmD9YtSWiO+Y7p1l07Z7E=
X-Received: by 2002:a05:6a00:348e:b0:8a0:7ba9:93ba with SMTP id d2e1a72fcca58-8a8317dd9bbmr11302706b3a.12.1793776538984;
        Tue, 03 Nov 2026 23:15:38 -0800 (PST)
X-Received: by 2002:a05:6a00:348e:b0:8a0:7ba9:93ba with SMTP id d2e1a72fcca58-8a8317dd9bbmr11302697b3a.12.1793776538456;
        Tue, 03 Nov 2026 23:15:38 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b097fe12f6sm507309b3a.4.2026.11.03.23.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:15:37 -0800 (PST)
Message-ID: <5e7f6e09-2430-4da0-9d0c-4daa5e91651a@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 15:15:34 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
 <029eac4d-9516-44eb-922f-73ebce894925@oss.qualcomm.com>
 <e05f0373-aa6a-40a4-b778-22f40a4de0a4@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e05f0373-aa6a-40a4-b778-22f40a4de0a4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyOCBTYWx0ZWRfXxLAQP+J9r21D
 keLhJX2lVyWpNzh2W/ZJdXhkPVDy4lfnJE19aXgmi5JK4p1x2tKGX0gA0boNgY1vfzI1EW3miSH
 C4GrXErT806PwFfMchulNhg4gorFIxKSBs3CF/uRAyddEl7Hl98DgCYMPPXbzgmgAt8+T9B/VNd
 nKJsdjscPG+HAzCbE8R53roINvpSX5lx0onsdz+l6Btdo0UPCXSTFokeN7dS10rQkC5zKkSRQfP
 RqFLN0DYXDGou7rkH5tF6GBodojiAI2zw3hyh6rmW+IArXwQkLaF/Hizk6sWg6x2Kyp/yXw3yYt
 ThxdtoaPjORqb8hsvcp+pS26AYnuDPevQyleHaUhUqi3sNqQTc7W17a6ubP4yg/UDwvwM17LZ1m
 eSxJp/gLF448L4gwu6gKOSAzERkFK0xu9Ww+ecbRsn13zy71Fj29h2/TGLELEGAuO9LALtvhAjv
 /T+cgmui2ogkUvyVBhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyOCBTYWx0ZWRfXxF10T56N83Rb
 wimnmrPJrpbxXQFC8SuI6RJDLUhI4b3yAC0MjNp1WNVE5pzUI7hFgTYFacrOJlzIRmXZZtkK2a0
 xm/d06F4CpU440IM6u4qAqUxi4a35QQ=
X-Proofpoint-GUID: HWCzcgze_SkW68peAAXg-K4ogw9Ea-Wb
X-Proofpoint-ORIG-GUID: HWCzcgze_SkW68peAAXg-K4ogw9Ea-Wb
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeadb9b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pEYuK4URmlPkE1wXD4AA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_231540_348528_B1692FD5 
X-CRM114-Status: GOOD (  17.08  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 3:10 PM, Madhavan Ganesan wrote:
> 
> 
> On 11/4/2026 12:23 PM, Baochen Qiang wrote:
>>
>>
>> On 11/4/2026 2:30 PM, Madhavan Ganesan wrote:
>>> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
>>> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
>>> logic for freeing a DMA-coherent firmware memory region and loading
>>> firmware into it. Factor the shared logic into common helpers.
>>>
>>> Patch 1 is a preparatory, no-functional-change rename of
>>> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
>>> is also used for the aux_uc region and the old name no longer
>>> reflects its purpose.
>>>
>>> Patch 2 refactors the shared free/load logic into
>>> ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
>>> rewires the m3 and aux_uc wrappers to use them.
>>>
>>> ---
>>> Changes in v2:
>>> - Addressed the review comments.
>>
>> this is not enough: you need to clearly state what are changed in each patch.
>>
> 
> Acked.
> From next revision, I will clearly mention what I changed in updated patch set.
> 
>> And I already gave my Reviewed-by: in v1 review, any reason why you didn't carry it in
>> this post? I don't see any major difference between this and the previous revision.
> 
> Based on Jeff's review comments, I have cleared the paddr and reorder the function
> definition. So, I thought I cannot retain your Reviewed-by tag. Please let me know if I
> need to re-spin with Reviewed-by tag.

Hmm,  I think the changes are minor ...

Never mind, I can post it again.

