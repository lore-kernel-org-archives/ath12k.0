Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE64460A261A
	for <ath12k@archiver.kernel.org>; Mon,  9 Nov 2026 21:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q6hh4N3I;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h0TEXYMy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9WoR2nD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n1/qIPJBqOaK5hrWrCC708AJ+9Mblbc1lKyhpBJKBjU=; b=q6hh4N3IQpmTnc
	d74eXRnfaC7OhdY+h9rvURHshJ28QGc9DqRb4DMBBXU4B9zalZD1AykOuB/qb3W4KuUT4SSmIgQ7i
	k9TrqoMG6YwrrvrbEzMdDx9QoU/cBK9l0/fOAK58HUx5PJmHYO8CX8EjlfBvex7T3JEbGSVaspXmL
	uiPUhJMLR5Q8w3jH0iAZwAcTUUCTGBNcsAm4/77/T6OxchFA6ROeYPPGZ4P6NxNZZ2XgHWEmSS7qk
	fa2OnFjTuN2cvZW2sUyXutrOwuXIE71Din7lgK984tx1LitvUFhTqmJi03snDO7eOxNj0+QKKKmYS
	sx4KhJAxZlouYSM3vXbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQX71-00000001nXv-2gS2;
	Mon, 09 Nov 2026 21:41:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQX6z-00000001nVv-1tXC
	for ath12k@lists.infradead.org;
	Mon, 09 Nov 2026 21:41:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAIrj1352247
	for <ath12k@lists.infradead.org>; Mon, 9 Nov 2026 21:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1/qIPJBqOaK5hrWrCC708AJ+9Mblbc1lKyhpBJKBjU=; b=h0TEXYMydbW0Ehte
	wQsHuEH89WnTTqkmrBY92fVuypuI7UbB5oN/FAaj03ZydZas0yPfsg4q+J/EB0FX
	NUhwuukqAlqBQxPwps8ck0Ofl7b++lbuLlDEA8XdJA3JK9qJgP5WShg1gfNsKhxZ
	SHfDmj8gz7xaPy75s9Fcd8LP3HXVBehfvmLWU2up/9umVQ96z9vTsVDd7TKK5MWv
	DQSvPHaXpFy0l/sWHvHfAa02YwqY+Nk5DjsFXID7si+E5uapYYXMHLtMUxmYxowl
	esg4HUiqFZqUPbUH8Loq3N83nNrC+5wiyXAgnF/EyB+lFU95DNo27EIvY9EVJiNE
	0M0p9w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapac6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 21:41:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so3477021eec.1
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 13:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794260468; x=1794865268; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1/qIPJBqOaK5hrWrCC708AJ+9Mblbc1lKyhpBJKBjU=;
        b=B9WoR2nDfytSZStefM8x67y28dOGWLNvM+2BHkCl8eUm7wPsrJczHJnq+y4YmO7RiH
         ksShOpwLal4Xuo1RvqZkwLQj1WRksu4A6G3x396eJRMEfwzfJEm2T9+TsqVMe5VqsDKR
         SwcjvG4wHkf60gXgrM2Fs3n12mSLQVugfM18gzIRpjb3DtFjSKmCmqGuvrbpwm+m1Qiu
         1fqccyTm+t8rwlP28Iy54SEbcQbp0M9qUoZoEuizJnEFA83gM+BFFByXvHyyHrRaqjmF
         J/CG4FqGzZmTu8Vk7cxE20IZuGd8gjG1/EhzHGC1m6dUxt1Q6YryD7aifOWyCEiPGXm5
         vTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260468; x=1794865268;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1/qIPJBqOaK5hrWrCC708AJ+9Mblbc1lKyhpBJKBjU=;
        b=P6/OlOtzdYCW1kBRh7HmnlqBTi60Gqcvu5bmaTpkcM6BTA5AkvmYRGNGoyQa8W9Sz5
         hbBILO0LKAsqqOhiOAcED9EgRrLH/QVgl4OUavCKXW7sAdoUtNnSCcvUxtPjop4TkhWF
         UyH2la257NC7M/ZYp2hLTIn+hU2x+b6Snignv9UkINSOKOb/xxNC86NpTWCmIr5T/Wf0
         TnjRZGqNh0Li4KW4Y4exHHYNAWbxjStMHUjzoRTLHjKJbXbbx0OIdbWUpKPvQa/Dmowp
         T/xWC60JNVOeVUu5jToxupJB8PxA02P9sE+XRVkpN5k/2F/R+lyKj3YBgHSba0zxHrou
         ZkyA==
X-Gm-Message-State: APuU4Z+kU1eRZTnTw/tm+FK3tLdiCrkw2SvWePv9YDugh6+ynHCOZGbz
	eCJHLw2gLUxvbpcTXj5CSpZ+q2i0cv0Q1T9tqToI4yxExgdJ0E0OTlQCSbnqf1hVfivUwJydg+c
	hM9tVPm0phHBkPXJwkHB5BYAQcbWs2kuDQJFYfDJ7TlrYZrgV8/IL1lK2a+PJ3+k5UnOCkjB/
X-Gm-Gg: AYBFou24n87jQVuhJPMaHj5G/5ON1MQ4NTSObu6s4hLdAkkMSei2As3/EltK7NNWP0N
	mhIQ672vqRO4PiNNIgXgiBgwOod6mdeQZuDXw+vsZ7TOgeGW++8uXftQjhkLkbTOv7qXhef1RUC
	CxpHeqvEAsbIk344CP2BZPEugF4Gnuz6/N7DYyyf1diqrmXcXSBf5oheSM7SMrw3/a482UxVBu1
	xm60npprWBbbaJY/J7Ik1ayYuANnAFhq1md6wZkXS/mKMhcbngU9CbdzHDqScbMqPta4JfCYNgw
	UK8fx9yDqEKnKdYBzQAvUWtajWKOupo5OqBbr/0W+kljflXj3YZtXAowfzJoC90nulyt095cwrf
	PfPTXVkrAZE4NKXEd7lASWC8BF8hfrEMuxyYiR8uDc1wsEyTT8Roc2izcCH8/7QNVVwAbc5A+7w
	gBoXfKt6OjglDVmRC17aByymKep1Q=
X-Received: by 2002:a05:693c:6384:10b0:372:32a1:b384 with SMTP id 5a478bee46e88-3751fe32260mr745602eec.33.1794260468243;
        Mon, 09 Nov 2026 13:41:08 -0800 (PST)
X-Received: by 2002:a05:693c:6384:10b0:372:32a1:b384 with SMTP id 5a478bee46e88-3751fe32260mr745562eec.33.1794260467578;
        Mon, 09 Nov 2026 13:41:07 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm989985eec.12.2026.11.09.13.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:41:04 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20261106111032.3157318-1-aishwarya.r@oss.qualcomm.com>
References: <20261106111032.3157318-1-aishwarya.r@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: remove duplicate ucast_ra_only
 assignment in dp_peer_create
Message-Id: <179426046400.3811579.5827170822859278967.b4-ty@b4>
Date: Mon, 09 Nov 2026 13:41:04 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfXyTQVmrV5tPNe
 hbFv66KtABMgrLWdrfzFC8hJ6ZQKWlv5gTjW8eiT6ucqY5EOO/kNnm+YM+C4JTVcsO65cK96ncd
 8oa5bPEgZTtckmC6WB122gxAEQhuV/LGSFCF9lx5E0bHIAqRZXTofsJRdfkp+eNd6vJPyDUNwJ5
 fmkcRCvYfIXCcdUg5i1XDWmU4S3jHZK7jNsapt3MnpLnGHgyGg/TLxfUmR6TmN9Wek5TyAJbOnn
 yG6LjIzgSyLkX/U4n74LG6cd09f4WRjeXg79OmxGc/q2VPaOUGKiOvBUEX+vFWjVM1LKZRYoXUg
 IH9HOyvP1lsxTBNfwAoo7W412qzZVbvxdhfQaouxSOpnJJhdspP6p+O4yMUpMdFHg9IVlnVnwz4
 zPcPjv5uFFU7NlmFxkAjgbbRHsS/20WARlUTLQJj4t9R6+D6MpbW9tQqeSnuSAOv3j0VzZNMmML
 fBuDWCkds3Lqoj1p/2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfXxMY2UselMtu4
 LF2JT6HnJJU993xrMLvWGEmfkAVvDne2vtGoELynkN2sqBkkcyDs4hRwOBgP7cpzoos5xWmuutj
 yCwtlQXGpWgIctuyttlPxoRDM2kWroo=
X-Proofpoint-ORIG-GUID: a0MgS26wupdSZL7yuY0gzceVwyZuMck4
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af23df5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oua-9Svr7Zi5yvPhmTIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: a0MgS26wupdSZL7yuY0gzceVwyZuMck4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_134109_504428_EAC8A8AF 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 06 Nov 2026 16:40:32 +0530, Aishwarya R wrote:
> dp_peer->ucast_ra_only is assigned twice from params->ucast_ra_only
> in ath12k_dp_peer_create(). Remove the redundant second assignment.
> 
> No functional change.

Applied, thanks!

[1/1] wifi: ath12k: remove duplicate ucast_ra_only assignment in dp_peer_create
      commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


