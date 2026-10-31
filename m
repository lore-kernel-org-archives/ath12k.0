Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E77606A31D
	for <ath12k@archiver.kernel.org>; Sat, 31 Oct 2026 20:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gYMoa7dC;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTypWbyE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tx0K9WJB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u1+4nnRf1i9Xkva61km0GKadiZZAe35/Fj/lxJjaKFk=; b=gYMoa7dC0PC4GMjic3IqVp8zqJ
	yyaeLH3yaAvF6k7hZUZxBkySC4hXCtFBhW5oGzHROSLy9A1P++2YMU2vFy3YyM/dT5E7Ekqnkbcuv
	/9a+sca2cprarBKT0/z/d3OI0YC4tJhFBCYA0HYf1tIoZ4komxxaFl4eelyilkD0WuwYFfg6YwfSV
	MFnE5WrEedCc+wmKC1o+ITzyoHDjxNE1CwUeUcwybjUeI2Z7jhMNGEtrXaz+GAGTNqlBEVlAnV4S/
	JIMNfc+DowyjKIJo0rTHiHAw7eN2sLDzndpHp4bqVfe4/14yT/yEuO6UOxmQ7V0RuLgOayb2Pnnmr
	BRx9omgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFmB-0000000DfWQ-1PTQ;
	Sat, 31 Oct 2026 20:34:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFm8-0000000DfV1-1pie
	for ath12k@lists.infradead.org;
	Sat, 31 Oct 2026 20:34:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFoFg2401344
	for <ath12k@lists.infradead.org>; Sat, 31 Oct 2026 20:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u1+4nnRf1i9Xkva61km0GKad
	iZZAe35/Fj/lxJjaKFk=; b=mTypWbyE7DNC25uq4Dl6xeMo/Wx5jLwWIV0BytVx
	G0YT3XnJVaVbuSKO937sS06Q9/NSvafcz/5UA1nrevHRY7V6n4I2hN/bHQNh4FSO
	EvEebdai5EEdnDT5G65XUyRGhuYf+3BzcFQNMIycpiTdfR9YTUik5lydlj1Df1Za
	NPteg5GgkUqUs0kRh/Ay1uZnhZAR+Nhx7SEuEc8lhAiYsfOvmBSA7epWt/FdLxFk
	VBwk6Vokpp2VrFA7lS1OCWsTNh1RfN4sNm7TptOW4UADQkhrExoohoeLVijd5rZU
	BTHNh3tOO45ANwInxiSrgmoIXP0LX6ehQYlM44ghSDOAhQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ehvtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 31 Oct 2026 20:34:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so387468985a.0
        for <ath12k@lists.infradead.org>; Sat, 31 Oct 2026 13:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793478843; x=1794083643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1+4nnRf1i9Xkva61km0GKadiZZAe35/Fj/lxJjaKFk=;
        b=Tx0K9WJByNW8iHBXfpzxxv3puZTmUiazE9ZJNpBF4RmOxPLVxjmlAh3iS5g98KQqEs
         ofnUJNtb8YqUUPbxok8wfWgEPXCF0a7IfgCChEvHwE3mrvaWoEXQX1EiL/Tiko6mse0j
         w9Mj7yZnD45G7B5lzge6baZdMGWYCEOEKeaalFQTJUC3scj8ujY+stoit9hJj+lbhWH5
         fd0+9UpDRVaZT89ww+FgwVtkHmQ7Tt+4u2GCRDcuxavX4xi40u00ODXYWlv1MeIuBzDK
         /ItQdch/4OjW2D7rytQQXahGRfClzUdWuLG5TdxWdfq6PevkOjv67lwSNN9LNt0UrdZT
         QVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478843; x=1794083643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1+4nnRf1i9Xkva61km0GKadiZZAe35/Fj/lxJjaKFk=;
        b=h2GhVgIBby+jHuvGBq2FSYgMtG/teyVq2wlW1OnIUu2sLXNALChOtIaESVIlmLzb1a
         C/qlq5/bqFLx7oH0RtsB1gGZQk9yfCOIrCLZG3+drN3OWrZZ2Ty6P71rEsdbmI1Ya02S
         DAFH6r4SGfyudGmPJdo1kBOXAd1s2vt9dfClSYASoUcSFlw0z2whSxxA2Q0A+LOAl08q
         e7QgOMc0mOMxXrjtA6JhMz0xZaigEu8Vn86Z0X2eNzJpPYsAzRGB1NtVXp6+I2GGX99J
         +H3JLU4VC4bLcLptuqylO5Om57wa5UeaVIF5s3eE2QHSE8yq2tUXrbBcpCRr4rnS1ovX
         XnYw==
X-Forwarded-Encrypted: i=1; AKwUvBzM1XFdj05OuLQlS9lgcB/S+oNDPz+j8eG2VL1pVhbxddZne/Py0M43963sdgTxoQYbdEJ4Zyo=@lists.infradead.org
X-Gm-Message-State: AFq9FYJOLCbSiDyWut3N39dZhhm2AqgXcEzazoGIwb/B/mFiPuOAJ6IW
	9X/+1rBH6Yx2qy8OjXyps7BuTnyyIHuINgWd6ykwHksDaAL86vhH4KVDxTOvyO1cnJOiw5ySvyu
	fA7rq0aTns2P02OH1Xtk9jjsNxB5+Eucs83BHS9qV0pQHs3DvQlxJwCMqn1+jvG3z
X-Gm-Gg: AYBFou2iK3UkaqpHjK42w57vpAJsux/LieYqSC6PVtPoBhyPprsZl1iZ/Ry83lxboZ0
	AlpQUkAuQhH0Y03j0vuwY8w3Oj3YSE1lDjlQJJWuOp6s7pPhM6PgUEytlIuUEudO50/BbHIu+58
	Xx84DaLDy7wH3u/a9ANXkpMedMZ7rnIX7U7ODCm3vfTK6qZva4YKFDWBoI976zyS6+W/wDtxMDl
	uxfQKyo5trkkZxjB7JcJfTXtY+zgmL1bVqZ4UFMVTojvyK7Oj0AMFpwTbYTJzBYcgPdwMSZZ6B5
	rLw0bPbVxnYQbaCASBwxCe+akAUB82SlCRAHiGnnSv5KJSnjFW1iL07a8rFHHKDHul28D13a6+h
	GOUzG1O8Qzp4wwqEFjABnL4eWAXGx2/K96QBIvyDTahf3Rk3mwi7IG8UITw9JeDssfgW2X0m+i8
	Pp2d5dtfhGJQNkCt2mVkfb+e/fW38Bxej9zVpivVKdhUbSLfFBHpkMRdw7527/jA==
X-Received: by 2002:a05:620a:2b43:b0:93e:fb96:68f5 with SMTP id af79cd13be357-94421799380mr994234985a.32.1793478842783;
        Sat, 31 Oct 2026 13:34:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2b43:b0:93e:fb96:68f5 with SMTP id af79cd13be357-94421799380mr994232685a.32.1793478842281;
        Sat, 31 Oct 2026 13:34:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd67sm782750e87.12.2026.10.31.13.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:34:00 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:33:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261029
Message-ID: <bfx5k2tljdl4rijelpcwgrsdvk26hf7ajv7pc5o2db73m5sgxl@72mzxbxhgzfh>
References: <1ea7911c-9dc0-4bb5-85b1-9fd7f72c30af@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ea7911c-9dc0-4bb5-85b1-9fd7f72c30af@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXyW3sZ6Ss1LW9
 Xpujw88f2prRuDpvN1LozH7JBaYEAeyhp/Lb44LZYNltcFVjkdajZkGDHr8P8UEv4Va9lv0k8mD
 kdsXnP8pYD/c4mGSVIcI2bJBnyVs+If6CQ+cn9JVH6nrlKISv7x7X2nV9cMmRc56EfMNaiWO44j
 8KpG6GweF0zX9Gwe5kL3yLkai9EksTzMSW7N+M9z2d9+ttzZ2qp/YPtiYasp8NtbrPY83ksd5Lr
 QEsLYSJBPTRmkiKhKCrbfcQiw8fa4/fcSMo+UdLvvRtLoTvWI7nG3G1OmoNBKTy9k2YwtMtxVka
 TmOwHb2lR9DtEEKKGBn3vXEDSFta3audb8O2hb8LLsBeLS682l7NciZ7VWPwMNtkWLy1gvK0ts3
 2xzrbbISPQh223vscr6SIn1Rr5Bq0oSlVIxo0V3nd/GemkXpqSWXzykEZFmNNng2kwYHGAMvjaX
 Fyky/+E40pl3T09zaoA==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae650bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=LW1wpjZNjeFz3wEaO24A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: O8dxZya6u9SoSaahQw7rde7gnLd1Wfkj
X-Proofpoint-GUID: O8dxZya6u9SoSaahQw7rde7gnLd1Wfkj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX7Wz3Cob1ljM6
 KPBiHLVXzQ6gBXpsfjJN9ltSfY6/HhV2uMJ+qwlFkhCo2gmQZbluL5ZRSLVwJC4BPzNvjvoILrK
 3CaaYthVvJdFj7iJ/GxZG/v8a8aoQ6M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_133404_502664_EF1DA144 
X-CRM114-Status: GOOD (  11.94  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 08:21:43AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k and ath12k.
> 
> For ath11k, add IOT-focused NFA725(with QCA2066) firmware and board file.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1343

> 
> Please let me know if there are any problems.

-- 
With best wishes
Dmitry

