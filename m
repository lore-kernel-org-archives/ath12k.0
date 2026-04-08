Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178B2105D98F
	for <ath12k@archiver.kernel.org>; Wed,  8 Apr 2026 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vimRX9C8rZXo7kyr6AmQLDGtvwOIoGfnY8kE/ALqjNs=; b=SjcnVg4WPoOe+E4OQBiH5Ufb8p
	WoqAQwFvQiyTJ1qNqTR+/ABD4JhefwQQUHu8FfO2dV5/yBsDSvbAjKFl88czxELVGEPJLE4YLW3vN
	vZjZIydjjIqaPvu1N1Xm2ChEPvZiY3Mr52t9WrdnqwRO6XwZ3u0WCiBWmNyZ2uZ93iIRpZ4tVWZGo
	AnEujlNSe1Zl6rgQYh21Y54FY2KAzM/F4LsBsJCy/Hvqkw8PwbccGTm3bUuF1C5cBX8J7ZMgnshTo
	1aF8a1SaO0gehND58kEfhuT63bo7xgv//ZVb59OYGRVnsRxBNXBPz5BL0BpTRIlokHwsl4w5nlQTW
	oUWYg2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAH7p-000000083Q5-39ap;
	Wed, 08 Apr 2026 00:50:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAH7m-000000083OP-0EDx
	for ath12k@lists.infradead.org;
	Wed, 08 Apr 2026 00:50:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637H7E0l2412018
	for <ath12k@lists.infradead.org>; Wed, 8 Apr 2026 00:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vimRX9C8rZXo7kyr6AmQLDGtvwOIoGfnY8kE/ALqjNs=; b=eJJ1fqyxXkwb9ol6
	of3M6Ursf9hiGOFuat1XokjgEFkkqadF97oNhlncIbDAigH9wWgXMTqXmzQyjyTv
	oPx4okJM3zstjAsgs5Jhe5alJcuSOQGQPSDLwQb8GAUYD2EH3njXBYim6+qbRpBm
	DX1THn895jQaAVxySHZnMbv/FuRPQUGmmVJIJuKv/eG8y5dGetTeZt3NBdq9wG64
	UjSiHxK/w4d6CHCtOtbbvtIbrokONoMhM/a+FMNaXay7O276+z1e2jYx5gvR6jXS
	LZ4RJScDFfut3u/yFBWLyWwMh9ItwMPO/5CTmVoptth42dLtOK1VGhRDkoQJZ8uh
	yYPEOw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61v9bub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Apr 2026 00:50:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso8222335eec.0
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 17:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775609425; x=1776214225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vimRX9C8rZXo7kyr6AmQLDGtvwOIoGfnY8kE/ALqjNs=;
        b=IclprClWbYtSmP+Q0pNsor3jmKBgCHtecBi/xNJighZCd6FpaTqjP9og35VD+zbd8T
         JBncFiJS2wbQemhWXoTNbfSNr8/KmlRrSAZg81L9Ay6Qu/47KAPdbH/QWsyWDg/3+DmE
         9EyAEK8WtQ2eaiYW8B6w6Pprh658PxlUqBaUxZJZN2eseozfqfx9nLnFKgbPX2ESnqJA
         DvnFt1RZ59pz1Y5ByCICPRQN1F2KfNSBEyKx4+4+QGWXCKVpq/zdY4mvW3vQ85eRXQ+V
         Hc9iHo2riNWYSV1PYvWvMzDHot1qsOKpgvPHAFOFVlQ8kIFyyFnlo5L5QhQUOKkskp5A
         GFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775609425; x=1776214225;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vimRX9C8rZXo7kyr6AmQLDGtvwOIoGfnY8kE/ALqjNs=;
        b=ZvlYKafTl8FQfX67nBdfito8SWb8a1LX8eXs4fRRoxxtB0YmVwHYMB6nEFdO6+znBO
         Z4xU+bf/q3RGoWbi58exG4iXZ/BJ16uWu2TOQEV9pFLvYYoR8I3hCTK5it+cYoVm4iLW
         jQWjdKuxZAh8gL3lpFjzMRHn5mvkmtH78kqHvC8nmbWFZ8opsjHCbfHUdnf0N269AISk
         i04s/QH+lY2SMKlzPeEb880/jy9BOcjqlOS9V5KQXgXB6fzYwM5f8GsVqxkt1NUDSdVY
         pYJonFb/l5mrxZ9D6ZJ7iOWRKiuSBaNvAmemHphB94s2ZIIF/eZnNZW0FIojcHzIIuuP
         hRzg==
X-Gm-Message-State: AOJu0Yw1bEPdKtx+CCU/wZ81lXtGQ92MJOGLVzzSDog+lt126kUxzcoO
	tpooLW6wpI66EfiLWB8pcMHLTRapbY5dL4pZ4cadmh0Pu8ECohXzMYAzimYeZXGrtzuKy1Y6RQV
	4b/2wosaJzeFcpfrCXF4YA9s19/vrj5RWDLtdxI99SEGCpmkSdohgOZbUH9R8FHTUx5F1gs89
X-Gm-Gg: AeBDiesahRz3evLRIerYRbhPPkQ30lpdALdRRD6W/z4DQyMLvQdr4b4WkGZ0T7G5dpA
	zbSm3cGI5aEiPWbfLwshdOv89QhH2IBb9RjwZo9zwakowLuz9AELbZ+jEcJ5uNDbehFp/MWr/44
	igRnEonLX3zGoC2Kwn20TO6JpgwrlxUh3hVwA217Tsk7FrdSH/ajGwKfp2Z2C1lazdi022DtXvl
	LjZwZj91S2MCEdOtH/4cv5JSFCWV0hgsEChZjUiy7gvnJCRk1e0gp3Y6BZdGDdmJeBLaggHGSid
	GRt/c+CHeDJr2+RJzeeKAEcYetyvv2VzlFvpY+m4olpuGOp28AflevtuQWK7v4mYeSi6cpk9B9S
	zHibfGuUzUSIFBJ04xD3qPsVkQ1UaQBBBkL0nLCkWC6MI845kQ35UbuMKTxHYUOs/jbAyPqvzaZ
	C1
X-Received: by 2002:a05:7300:6d23:b0:2a4:3593:466c with SMTP id 5a478bee46e88-2cbf9fe2d96mr10104012eec.8.1775609425398;
        Tue, 07 Apr 2026 17:50:25 -0700 (PDT)
X-Received: by 2002:a05:7300:6d23:b0:2a4:3593:466c with SMTP id 5a478bee46e88-2cbf9fe2d96mr10103990eec.8.1775609424539;
        Tue, 07 Apr 2026 17:50:24 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d2d5409fd1sm1257301eec.13.2026.04.07.17.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 17:50:23 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260331045834.1181924-1-roopni.devanathan@oss.qualcomm.com>
References: <20260331045834.1181924-1-roopni.devanathan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Rename hw_link_id to radio_idx
 in ath12k_ah_to_ar()
Message-Id: <177560942382.2878209.14614851259442358560.b4-ty@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 17:50:23 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAwMyBTYWx0ZWRfX5e9H5RiIOswB
 tbE0dT/KDM7vIJhr99MWVyqlGgHM5AUEQZVaOCTaFG+T/QOODA6bDUssuGcZMuWxIIzD2k7AFqG
 rdD0m5BFDQb2R2op+7h6yNSR/PQduLj/k/AdNCWKaPXiMLu2ceDjbffHp1eRBjZqSAITcMzs6j+
 2+gNVpEf1BoT8deJ5l1haRCd2+mCaY8VwGtOvpC8cjzVgtwyNeNJsc4tkyyxsZOjn5Tao8xLQYv
 aifDku7bJl6IqyXJGKjhY+PlvfOSPkrpLq/KjGW2f522jOF5YImFuR/E051HLXhHpwpPqINtvna
 0moKEAGie7c5gW0XMlICwPh/AaxpwjrEfJWlIAybASFkgkLMB4Iu1w9Mj/izRcBt3obJDoi7FpT
 MaOKXi2elHxqvLM9OAdE2rMVIfF8fanBFyvZwms+Jl9eoJNeO7jTZb1sCbvD9PoKjXJNQHn9q+P
 mIv+xn7ILsmeYvOqjpw==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d5a653 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mRwJYgxffaLpAow2y-wA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ub-ZRar1NH0Stb_lnteCpcl-cmNJot1V
X-Proofpoint-GUID: ub-ZRar1NH0Stb_lnteCpcl-cmNJot1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_175030_277384_3A2334FB 
X-CRM114-Status: UNSURE (   9.44  )
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


On Tue, 31 Mar 2026 10:28:34 +0530, Roopni Devanathan wrote:
> ath12k_ah_to_ar() is returning radio from the given hardware based on the
> radio index passed. But, the variable that radio index is received at is
> wrongly named 'hw_link_id', which points to the hardware link index that
> comes from the firmware. This affects readability.
> 
> Resolve this by renaming 'hw_link_id' to 'radio_idx'.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Rename hw_link_id to radio_idx in ath12k_ah_to_ar()
      commit: ba563287beaa99c18144b2e39f63b89412abfd18

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


