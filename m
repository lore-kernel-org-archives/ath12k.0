Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B17C79FBD
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 17:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lq+E/DtExS/K2hKw8F7y8TA3RGCSV6t53wrhIK3MQfM=; b=VYRnBr4q3vMw4BY3lSjCHBkFzH
	M4NwwGPLHm3urHROi/eHEfv0cbVM5+IKs9aZJejBQps05NjsK4Lb94OkbL8DyA9HW9oDLpHC2GP+Q
	XdvUZHRxQWH07BKuAQXw8QT+OE07VBz1YzfOb8bVfTKB0pWPMQOCuDSssDNbJ5LCfNsZCaPQpNRCu
	aTamRTAI5hIB7cj4sJZO+ECZYSV84Rw9hlhxZRGJfr/Re1YdK9sl+D66Yqplp/RQQQNcMxB0EkKwK
	TvfzXDpryWLR4EDSH4LN46vHDyUHyURYsAJRtNI2w1u3Q0HGSX1YW/jVfeNk/DkvzsDE6hwZaQkJG
	RdqV7pXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYZ-0000000CYUr-1qBS;
	Wed, 09 Sep 2026 17:57:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYX-0000000CYSp-0HD8
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 17:57:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7Fxj3412136
	for <ath12k@lists.infradead.org>; Wed, 9 Sep 2026 17:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lq+E/DtExS/K2hKw8F7y8TA3RGCSV6t53wrhIK3MQfM=; b=pccJ/OmTFYGee8lO
	hhBBBimkFHu0e8FUpFWQl+JlB1dg2iKC7w7/UL0qoKKxGEPssJYe8cRMIMsx9Lc0
	jCedFLFYFkeBPcfevFx40YPUbm6s2qHTuaNeLuWWjWFgT0DeOUML3A3XNv1956+b
	WsXYZAKsqzuiho7moDgWUmr2JksPvkLzzI5QRJeSX2ydzq5rvr/MsubEbsmiO9vL
	nHjvn57eCsB/gai+tChRsej+TfK+c2WT1LQp4wGwTiP8mYCXOCxb91je8AcS4z+i
	Sg8iXPUAuj35IAX7NownqQC34UmcySBlJmfuV7IiNrKp6QwVg0ZNnLgbaGzdptuP
	cKol4g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh1ret-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 17:57:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3b126c9fso60220455ad.0
        for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976676; x=1789581476; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lq+E/DtExS/K2hKw8F7y8TA3RGCSV6t53wrhIK3MQfM=;
        b=TMqUlO+QBKfk4L6S36Nil4xd+1leT0cn7jeFrF216Dvzf3Dcs4du0Wc2Bn9YDCrzrk
         fqL6+v68RK64vXeh+bBNBGVmjDxI28UBXVF2kPBcNWKMQg7tjdqdr8geINvgDfOlvhyD
         XUaRlVq2SC0V8DAICrtekXeb/W8v9xc8zGoPE7LVeBs4WZzZ7qxhXnwhMFIvcd2yxm9w
         MyMUuslcgx7Rsri8qdVh66y9+NuoOfKwXQob3d/VTn0OLUJ+zT4rMlml6kajWgw2NkDF
         GXkn1IIXPPfefUMzHk6zcYsEVVerpkYRIcyokmf6/E+Yhrbvu2tqFnJH7GvzFXkJlHjv
         rEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976676; x=1789581476;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lq+E/DtExS/K2hKw8F7y8TA3RGCSV6t53wrhIK3MQfM=;
        b=e9w6f8lf/BQexsgPa0tB3MOCHk6IH0lJw++8G2csxxNQpn35dhPVaiYPMlGqlkILL6
         Pz8fI4FQdYE5+HNmx9r3lssXyVl7DWlVyxpE9WgshxAGPMXeZaI6f5IvXxGTXArSOwcf
         1cIvPD1hJRbyhLY4ulIqVquDyRiUaktNEj4ROKGwPYQsSD97/AjHd5C0eAipyyqTlugo
         CBX9yqcIAXrW9O2dUEpPrMV2F6eyLXWa9F3myIYnr40Jp3qTa4X7e6Wh3VGOjwD7kEQh
         YdfFwE20lwEHTR48+mQ0JwxXwlpHtdeZPtthA2SHBSyDvtd8D1m4ABr9y3DZa5ZvikxT
         jckA==
X-Forwarded-Encrypted: i=1; AKwUvByHIcHgNw6M125ynCShR/oUnTbg+f+0lTkydDf0bGKU2ijt163JQ3QI64pzuzVJJPhnKWuIngw=@lists.infradead.org
X-Gm-Message-State: AFuF++lCebj/tzpC4QcOZwr1yNumiA+q3UaKIkPZ2IgMGxd00SOONnke
	SsYOapxv7DEEUoIAA5giM37FeQHqy7Y9dyOI4nwD2usDmyL4eu41Em6zZZYEAyJS2KkwunpB67a
	pLrirqCWXwPyu0NcZwn5a2nUBUqXAqPa9Hmvw79WcZf+7ISFdGrmJOApzpV9N7CFt
X-Gm-Gg: AYBFou0sMys1Fe53+ZI0RZEtuXFlX975ID1oEu7gNiXaTJU4tAS9TAwFu61Ru9/yYtC
	/GoSr8l5Co+EK+f2xhw8V3zvKZRhtozL2HtwnGCy9wxMpSz9d8v0jkOuq1rL2vTG/SU5sYCLwll
	sN9M247xlSIFA4dYpmst4pOcdT6BoqcIdFwHYEe7ntFPGaQ9OQ87NFPsCAOko45rp55kDpomppt
	QaARp8h30Dx3Pqqp9b+lSLlRFgtoK35VK7vVi+VwnVSJOEx/F086O1GAy56K1qaXQz4ecQVrEJB
	EVzz8UdBulw2cQFvbNgCGLccpBatWOEpTIWLXv97vBkfUawQMBejc77zVtk8ueuIE/bRP8C2CQa
	MKOTN+/ix+oNxsBbRVmPLpYK571RGumvl5KqWC9JV21mLmsPWStLXo9s=
X-Received: by 2002:a17:903:37c8:b0:2d9:50:a91b with SMTP id d9443c01a7336-2db12667eeemr526586195ad.16.1788976675973;
        Wed, 09 Sep 2026 10:57:55 -0700 (PDT)
X-Received: by 2002:a17:903:37c8:b0:2d9:50:a91b with SMTP id d9443c01a7336-2db12667eeemr526583945ad.16.1788976673672;
        Wed, 09 Sep 2026 10:57:53 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:50 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20260818-ath12k-uaf-for-aligned-tx-v1-1-d6ae195b15e7@oss.qualcomm.com>
References: <20260818-ath12k-uaf-for-aligned-tx-v1-1-d6ae195b15e7@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix stale skb pointers after
 aligned TX payload shift
Message-Id: <178897667030.2048605.17567905467516940923.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:50 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfXzRPt89kZs7qR
 sNoLU8nx7DTExrhQBTYyfc4D2Jqgr6+kk8ocMK5+Fnuy3GtP+qjinx0Tjo04dKiggF2DQ0ojTqa
 dCWn6S0fNnCMOileMQXkVGXDELE1iLu73rGTNtYB7D1dGLbF4p5K62ymBbaogOC1ahw2raVaADo
 zKT+tUGxITry+fLF3NMobGB/LUOvkJTyqbCpHMbJ6uMllMoVdVK2M9+wzl2JZp6ku5XbSfpJKxx
 0veJxTl+9pJb3Jm853WP2AmpX0YZIO5/CUHFlT5tkrjkfvCKihZtC2ZaOjL93W7fZgZqXKv5kQm
 vLPN4gBzaRwLXlT2xKwifhxxiWV+m5ACdyXI3KSD6EDk5GOClfjDPO5E4sZyaBI72dEVGrN4D2u
 ameOb/dBE9dvmsWpNT0zJAglOefoGvr/4EzFoEDNa6VCpKjNmlE8GSXUnN2RSHlgP9ZOv+2q0os
 cug1MMlUwyCgDDeyeSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX0fhUQNBbT8rV
 NV0lUhIGpCN2yz2L1vIBk29w2DNhO0LI05oz+d4sgNyla76JlU4tW5Lpfjxo4Fzr2YkFgK6hpiK
 YInCkXGFnKYlRb7sJ3Wc853qau+JTDY=
X-Proofpoint-GUID: GZqlV4GZ0PRc6RfAUnE_6VdY0OMQdRxx
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa19e24 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LZryh2L09-yJbEDcFkoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: GZqlV4GZ0PRc6RfAUnE_6VdY0OMQdRxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_105757_112170_FF268AA4 
X-CRM114-Status: UNSURE (   9.67  )
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


On Tue, 18 Aug 2026 09:44:48 +0800, Baochen Qiang wrote:
> ath12k_wifi7_dp_tx() caches hdr, eth, and skb_cb from the skb before
> calling ath12k_dp_tx_align_payload(). That function may shift skb->data
> in place (when headroom or tailroom is sufficient) or reallocate the
> buffer entirely via skb_realloc_headroom(), freeing the original skb.
> In either case hdr, eth, and skb_cb are left pointing into stale memory.
> 
> After alignment, only hdr is refreshed, leaving eth and skb_cb stale.
> skb_cb is written immediately after (storing DMA addresses), and eth is
> re-read on every TCL ring retry via the tcl_ring_sel goto, so both
> accesses are use-after-free or stale-pointer bugs depending on which
> alignment path was taken.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix stale skb pointers after aligned TX payload shift
      commit: 6c40719489c8d799798989b15bc07b0700c132f8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


