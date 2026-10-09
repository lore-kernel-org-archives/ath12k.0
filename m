Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2408ACA9EBB
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 20:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDL0lTK23qbaiBwfqM1xuIN8jBpy/LvRkHDmRDr3tG4=; b=BnZCYrAtyLjQePw79H+ZsfsVKs
	F6LamiVJz6IwJWfBQ5c3l6GXnnCELzmrnEcobxh3HnmJDWeuMYwoGYONt2JUZtYjpWFku+UVOcxi8
	giD54AR3ZJWTulcy0KGmZ/NBS1UYKKPRBAXj6Nvz1Pb+gkrGmf1NDLxoBML7lAwI1llXJjYL9zKzp
	CSA8LV49elB9pj14nXIzjuWaUhwtePgiMuQp4NhOaXYysiB5VM3rWMgnrXjvXfy5cr5ArdDTPJZzD
	xxA+gkmTMhT1TkCrLBKu79wlfdJ1y15hKcU3Xp+ouMNAt4z/bah0mdzZW9jPUfcsBICu7xdS4Ou4G
	4B5jfL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFH21-000000079NX-318v;
	Fri, 09 Oct 2026 20:17:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFH20-000000079NM-15Iz
	for ath12k@bombadil.infradead.org;
	Fri, 09 Oct 2026 20:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PDL0lTK23qbaiBwfqM1xuIN8jBpy/LvRkHDmRDr3tG4=; b=qNOBCH24hRSyUUl6eIC3vfYBO4
	8LxCQgwTwXB1I+ONBVQ1/54s6Omc+Ro7OONv7OVzgI91xIZ7XQmd8OWnBRd0VcnaW6zjjTeMH66cF
	0reBxJq9LcJdo+dhT8yN139FwAq0TfQshdp+cHiIh1Z9+/+zCzUQD4cFfdUrLrHSeIzskBG1ssJrQ
	AxNtCwAxlzeQrw5fEsR6Wvg+BoQRV2qV0k3hGrdPmn1o9GhYzi10AflF99Rq5fWHjgTLriGVTmWuG
	y60OUbViNU4fG35ly2eUhGPUg69mhcc8EPGEhaaSqs1Q+vOn72DBg1XiBFQCTXwDzMFfZ6lh040bZ
	QueIbUPQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFH1v-0000000BcM0-15o6
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 20:17:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699K0aX32770698
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 20:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PDL0lTK23qbaiBwfqM1xuIN8jBpy/LvRkHDmRDr3tG4=; b=OLK6sFPS/2ZFLGoc
	tbT9BMUIiSI5bTvQoA15sn9i0PYjcXdbnWo1ictUhdcCEgYZRnxYz9jKzntSG0U4
	QxzfF7esWfDu4Kt1Ktr6hcE/zqO7myRchBOgeihUM6UPrVua1x0PWqReUVpwoyCZ
	kFy7xhYKMK15uZsLul0E3tzqK5BL/fR34IF8+1mQf7KUK6B0BU9J8fzHRmxzEZF6
	h8ayL1a/zusG8UNuN3JckUeKU9pUBFhwPeuTLLZdhdMDwCW02eBcFb1ZoVB3oneH
	sA8Tcp5aDFy8fSCnUOFrv8HnuL8y6zOLkHt7lE30MOYfKqOtTrKN8a9jl3l2pXRy
	9AISzQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t88j8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 20:17:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3515266f6eeso174056eec.0
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 13:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791577037; x=1792181837; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PDL0lTK23qbaiBwfqM1xuIN8jBpy/LvRkHDmRDr3tG4=;
        b=HQ3po4un+ucySfXPnaXAarHkZShE5/WTEoOF67trDe0UwFlK080VcelZp40OkRdfdv
         OK9QQhhQFNCoE3mhLq8wER3xYgCraMmJLrIhMD+ai769j2iOirOYOhsazYJaNfjh2tyZ
         PaBfUXoj+5sgvzgaN1l/85eYtc+1xoSgmLJT3zLZUcgMcK4x9nUnc9O/BmEA+oeHJtRs
         GhEdnaax/wCVIXwBzPf6JxdxdKCa15dohw4rE1FSWvlVwQ2+H+VDDunkSRpwwMJ85uVA
         TwQRb3h991xZsqMAhivPXKSTLiZ2kfXUESqngdvg+KRfSuGPL7i1rJxTwprP9kLsI6en
         28tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791577037; x=1792181837;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDL0lTK23qbaiBwfqM1xuIN8jBpy/LvRkHDmRDr3tG4=;
        b=RJIWLx3UN9dQuZqng3PkRXl2zP/VvzjVeZI8BPYUjPjl/7sD8GrAo1bkCv1/J9NJVq
         DqIdnXWtoWg9Vnhde49vQEf75xhbX9AK3OEkG1OSAiaq/QBT+vkRwcf1MN+uA8zLUxiz
         Wf+fZBvy/pPfNfVD/thFQ5r3gsDlSj8Fd+Z3ZMIHfnoDXQ9zFizcCCEdDCeA+3WWjMTJ
         wOTuUp9BSjD0b7xDl3ZpM8j0dk/66zF5kBkecAGOC9nY8jdeh2L92xJOW7GHnfIYBfTo
         bLPZ72wxkjmQhLdA2lePUOK65uH176n+yfEpjOiXcR3SPsTEO3DQiLge8FVTjNHrzT3X
         wEgg==
X-Forwarded-Encrypted: i=1; AKwUvByxBFhdnwJvV9Jllf1fatTxf9UpyLbRvjRxypHPKlBSPUUBKVIG7GePOX10IUAu0iOACoykVGQ=@lists.infradead.org
X-Gm-Message-State: AFuF++k5UkviRJlCCAzzhuzZjYA9Y8fBr6S1j0Z7w1sXJVnUIRbRukhf
	Q3TLmIy+oAXVHGtkm/mpdfQPBxDQLsjrF7Qll2cb7sVagC48q/i77xNRjBctB8G4M09PdwsNOrH
	1jZzcjjNabtgPef3tZhEUeuXdDyuw9XbfOGavQxTcvJqyBMUufdLpOviLgw4e7UAw
X-Gm-Gg: AYBFou3x7IyRlsMmxFva5x2hCCAXEYPXVp0Fbw1NnZ8Qkt/VPTbvj9eoDt4FHEUY5KL
	7Iji+zlQ/ElLmMEO1mROE/hR+wB1ahHyq1FnXlROsdAfHRdfe7xDxGLWjs2p0NmzRrG7BJwVIEc
	hEk40ZMmzww16X0//tlNNry0+B3OlqDCQUtH24g/gFQousIDeAZTQu7qQbjGB8Yg8saeg6AAToo
	zSBLOHHTkqCACtTTeL/Xk2Cppnx3KhtEPzGcPMrtYcGf3mChTPgBupjY9KXXYiz4zDckztDqDTd
	v7nA53zzHyfvD7rHT912JBXMLRI9mPQzUavuyvd0Vkn5U6o2U194n1ArtzrD+f/S6N08N5nhQy/
	4FAxkOyjVkt7A6S0i3GRhmGN9JaSt4BpDg8E9JufvW3I1fz9/jDXtnThZYw==
X-Received: by 2002:a05:7300:ea11:b0:353:58a7:c0e4 with SMTP id 5a478bee46e88-3537e0333f5mr3800175eec.13.1791577036788;
        Fri, 09 Oct 2026 13:17:16 -0700 (PDT)
X-Received: by 2002:a05:7300:ea11:b0:353:58a7:c0e4 with SMTP id 5a478bee46e88-3537e0333f5mr3800142eec.13.1791577036136;
        Fri, 09 Oct 2026 13:17:16 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm10963957eec.9.2026.10.09.13.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 13:17:15 -0700 (PDT)
Message-ID: <40903cb4-e39e-43de-be81-27a5f29aeeac@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 13:17:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Fix NAPI resource leaks in AHB
 external IRQ paths
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA4MCBTYWx0ZWRfX7YKDFtbq1/i8
 55o70ORHqcWM2HFW72IHdIVgpSvrqUEYz9FVFRDIsgYnLzTXzETprGlNWLATQbBhAS4BuZNXuH+
 yTL7qEZXq06d/OnLbfIGBfUyzUQ82eA=
X-Proofpoint-ORIG-GUID: C5Kyqi1BwlOLTk1-pKaZBB35dQzewDQg
X-Authority-Analysis: v=2.4 cv=D9jSufRj c=1 sm=1 tr=0 ts=6ac94bcd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=9K0OBibQ5eRIEVzO70cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: C5Kyqi1BwlOLTk1-pKaZBB35dQzewDQg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA4MCBTYWx0ZWRfX/kElC9/vABH8
 7jt28/ntq59v4I1Wgf9H27lnjS1xyOJ5SXGTG6kQyKz+Oh8900fze8clZzzc12D5c2w10VeVf4x
 z0arO4hxtnsdlJVCywJnPJXQsqDejN/WEBBO72i7kEtcGfKnOzQsocTv0l3ygv03xOu1ioLzUJs
 XdYc6mrF/U3UTiWS2Zziupjtm0jHty8JhYj9IrbI7+VFxGF1fT3o2/gLwX6VjahK3mkUccfxU2w
 TNWJPptkNoFjtZ/El05Qduw9fXlzhbd1NcpGwdIKm2X9zEIEMR9xVXT5oE9rUnQ73a+aW8NSGmG
 ddCm7qB/Kg4THR9qttsRQPyU7MdxvQu7e74lbedZsUSTHL1xfgmh6x09sQg/0Dz0SJ36IOhxIQ1
 MKjewn73/Heog9znHszu/lhWGUt8ZRNIFBOXBlDqObJzz1sF2w3610j3ppVFxMiLJ1mTOvt6V/a
 ZlFV84DOkwkpKSCi0Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_211725_149676_4C3D1A5B 
X-CRM114-Status: GOOD (  14.56  )
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

On 9/30/2026 9:54 PM, Aaradhana Sahu wrote:
>  static int ath12k_ahb_config_irq(struct ath12k_base *ab)
> @@ -1353,7 +1382,7 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
>  	ret = ab_ahb->device_family_ops->arch_init(ab);
>  	if (ret) {
>  		ath12k_err(ab, "AHB arch_init failed %d\n", ret);
> -		goto err_rproc_deconfigure;
> +		goto err_free_irq;
>  	}
>  
>  	ret = ath12k_core_init(ab);
> @@ -1367,6 +1396,9 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
>  err_deinit_arch:
>  	ab_ahb->device_family_ops->arch_deinit(ab);
>  
> +err_free_irq:

my review agent notes:
**Misleading label name `err_free_irq`**

The label name implies IRQ teardown, but the IRQs registered via
`devm_request_irq()` are automatically freed on device detach — no explicit
free is needed here. This label only frees NAPI/netdev resources. Suggest
renaming to `err_free_ext_napi` or `err_free_napi` to match the actual
operation and avoid confusing future readers.

No need to post a new version just for this -- I'll make this change in my
'pending' branch if the reviewers are otherwise ok with your patch

> +	ath12k_ahb_free_ext_napi(ab);
> +
>  err_rproc_deconfigure:
>  	mutex_lock(&ath12k_rproc_info_lock);
>  	ath12k_ahb_deconfigure_rproc(ab);

