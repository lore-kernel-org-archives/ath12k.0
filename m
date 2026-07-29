Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A97AC53200
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 18:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1YdDOLjvhqgPoiYF88zTnwSmsdQaX2EcyRup2NU+yM=; b=YdJnP6CXwIzkDNOg/bbq0LYhD3
	ovuK7amLe6qEi1J55Ybb/xqeBKfGGeWnvDyhFTXi4Qw9w0zcvJfHD9yn1f1iaqj/oeFK8QKX3CUvK
	J1APRhKZPPp17NqHaIhsFze8GiN5oKVsA/6681OrohMxAFJQnqxNQwTKW/gfheFatRjeE72xK5HN7
	bisvT0hyXG9AtTf56s/qnyRnlvI8hIvfjPuoOA7zfcnz3W7hLIG0kxLxXXIdr6aBGRIlfiFf0PTx1
	yolsYdKoxhf4FzVLgulXKh2GLXoglawyL+FvXdUfk6Y333KzuEeFWxjGzWowWsPVxqEYUEnX+2kH7
	2UebvLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8kc-00000008mlJ-2CcU;
	Wed, 29 Jul 2026 18:11:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8kZ-00000008mkY-3Y0O
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 18:11:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3HbB2194973
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 18:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1YdDOLjvhqgPoiYF88zTnwSmsdQaX2EcyRup2NU+yM=; b=SQN/f4cXddpgRctD
	6W3VavE99c2kl/qVLjwCiEMuxMtDNLGHJFmYuNZLlaOj0TZZE3WdRhnlJBxoi6JU
	HVpKiLXPSrifJz941oYEorDFf67qXEF6y+Z7HIjTY5Xysb54aOKHMqt5j1+G2x1U
	HzeBK4YrBEm6Rjm4Aa0Fijhd3xN3ekN8jSRJHzZfO1hKCsBiVMN8sR6ZE3hfujG3
	wLk2HBJ9fwRRCXcrm7vyHLUEtk78h3tejkWSMJ9tJM2UHqE5TXIhpZjdhVfQcGlK
	2TuktRA2oRTqN4mUcmQdHeANoKqYt7ssLUYPcDEAsp80UILntivxFg1USBoQsu9E
	El/LMA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkfm97by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 18:11:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6823efcso11458815ad.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785348686; x=1785953486; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1YdDOLjvhqgPoiYF88zTnwSmsdQaX2EcyRup2NU+yM=;
        b=CjYndDrGltGydiRUqGt5iSDmue3LDMe+VOCpE/lsEjvZmFVJzxC9foGm62wT9muRRn
         MiUQN5mXBjhDIAhKAX3LChIxfnUEtkktas1sBmn2IUKbTgsDImj8sXU2Vw3lXxn/TwU+
         QhMp/uDkic8OovuihPgSKmDSu0yjuKNg3pV9zqzwHfnAkWntbM9FHtr4X2ZTvSvxuJKZ
         gxpl6MdghMyo4MGQXLHZU/uFfoDHuw70GQ55coKbnTw7KHNEfjAzMFN9WThVqTGIoxd8
         Ikhs/hQJ3iEurmX/BkxEVEnQSZJFaAFShGYsBu32flN6UuZKBevV/sOEkULnZJGojMFt
         xWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785348686; x=1785953486;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1YdDOLjvhqgPoiYF88zTnwSmsdQaX2EcyRup2NU+yM=;
        b=sUL6yWbTgAPr7Sayj7wAzkBkCsG7kZ0jvu+NOn/4+2WW1KDlAIMComnRVCRZI8N7lz
         wzxpDv6ynGTqJzEqloy7ayROo/GcOZNqw17PVTwI/JA1ZdbDQd5WBi4lmg3Ywgmk/Xiq
         jZhmS89IJkGPuh4QOS6SNyxIOrJvwnlD9DxEsiljEk4egJly5f6GqsdMhKGRvTeXjZy0
         8FdutNXSO/mKy4UtHdGNG5gKgLakK7hyaYjbZPjzhRl2Y8bA25DoJoyhTqitGhFN2jcL
         5u8yXs6yd25raY4vUkuSIxidQ17fn83xqgUwaE27PX8Cve8dpUg6SckdaoT3LNWTDT2q
         1fUg==
X-Forwarded-Encrypted: i=1; AHgh+RqT7s/lHiVDp8VqmTb8liVv22nPk1kDmQ0VjveyunYJG/zSH0tqGo+VfdgSkNkp7xA656cd3WY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6q8yOpqO3TvVroPAhY9FfUrJTpwBGPm7+fVEmKtMXnUY+grI8
	hFPhw/Wo1IZieAgQ7npnCP48v0cGE6WjzNtzVsCkRBXxoRVoWO5gKZsNhShyp4ks0aN2r6fUE0X
	28EAUpzk9/BYu9D6bvOe4XrU0q/vcMyFJXJXynZ+3NUflL+xoN8yXQLuBxH9zi/KG
X-Gm-Gg: AR+sD12JWqZ9E2fcNm+DVDhhIBNK4JXzMazMhBct2/jNG1TRDVVXxSbwoODIosxxeqO
	eZgfsTVun4nipge8IPBEBLoA9/INqq2Y5wXpfnH8ns7FqtqvD+MY+l8O2vqPnt4kTJ/nUBEBPEh
	gDIVj/1IIzhwpdTXzeVkCRTOLYfUNCtsa/EAfXPWpwjXqoT7D7Lxcvu1ugbNPHVMd5d/BC4BTfg
	Ffndl/gISJqAyGsOKfjist7lpr7GNssI2SkgPxLWLSwVgZx92IfkUSZuNQ4zbQ/rvkAZwMk7x/T
	ecxB/tNToa3OczoE7uuTcZcGFbPnl0bVlviO3dTLAUWutftFz4euw9AJRCilac5YOYM6oVxpi+2
	cfBXNhaujn4j8GAxj5JRDowtK+y6UHT4D0s0HpWpNtnnM2vIc+1QUcYPn6IkV
X-Received: by 2002:a17:903:37c5:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d015b0021bmr83034455ad.5.1785348685727;
        Wed, 29 Jul 2026 11:11:25 -0700 (PDT)
X-Received: by 2002:a17:903:37c5:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d015b0021bmr83034165ad.5.1785348685262;
        Wed, 29 Jul 2026 11:11:25 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b1246dsm11149180eec.2.2026.07.29.11.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 11:11:24 -0700 (PDT)
Message-ID: <41a1de7c-5366-479f-a1f9-171d2c0fead7@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:11:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath11k: reset ar->num_station on
 hardware start
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260729080932.3462066-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729080932.3462066-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D6p37PRj c=1 sm=1 tr=0 ts=6a6a424e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=i2L5d_RL8Kv-G60V4MAA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 5csuDSlNxQ5ad2U1B8dl_oBqkag19wQC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE0MCBTYWx0ZWRfX0kC9NcxUW4FI
 hpWKZ3W0GaRNIRUrhBswjKQXwWs3eNywBEAqF7BU6JRCLAZO/6t2uiQukE2E91Guc2DS8i0t9/0
 XaxMZzGH++sWXmx3lvZnOM/kv0yiOSI=
X-Proofpoint-ORIG-GUID: 5csuDSlNxQ5ad2U1B8dl_oBqkag19wQC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE0MCBTYWx0ZWRfX4MK79TlLpjjk
 /gzo+uHqtnENiomwHvycnUFL4ir0y3ONjgHmZZywxJ/E3KebHl/2i2f+fe961Wt43jHPXFVqros
 6SNyIfVtiDm/XzppPncPpxhwa7sdoLFJvBn97gOTb//FEeLUBuCBQf6/8z+QXXBfCm0b7yI3Mtf
 /P4JxZVPXmAbaUgpxFXc/3fB0qqeGzYM44uWQ8tFPYcyAtW8YZLkzkZTEXnqhhZnjixMnPQKzvz
 7YeLxavzL6mIzyu685EQtq3Y/dghtjfNfwGWZINjPpGnZC8126ya+kGazCID6PA2LN43VRcTymV
 b6KB93KGrCAHs7+qrFE4V94LHt0IkNkPOZtw0crSxiOH1yV3J1aRGmw4uazS+7XkPUI/arYSIv9
 SyWKBU0ZoSMIQIz8JIk9Lrqay5agg1CbR3UBmq9NrcomkhGi1PoL6hF7Z67g4FSLduql0aLGq2x
 Fyca+Cqq9NVh1SkH0Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_111128_011098_CE4B4B0F 
X-CRM114-Status: UNSURE (   6.37  )
X-CRM114-Notice: Please train this message.
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

I'm guessing I should drop this in favor of the one sent to the ath11k list

